<template>
    <div class="overlay">
        <ox-loading v-if="loading" />
        <div class="modal" v-else>
            <div class="modal-header">
                <h1>Зарегистрироваться</h1>
            </div>
            <div class="modal-body">
                <ox-input type="text" label="Имя" v-model="name" required/>
                <ox-input type="email" label="Эл. почта" v-model="email" required/>
                <ox-input type="password" label="Пароль" v-model="password" required/>
                <ox-input type="password" label="Подтверждение пароля" v-model="password_confirmation" required/>
                <ox-select label="Кто вы?" :items="user_types" v-model="role" />

            </div>
            <div class="modal-footer">
                <button class="success" @click="register">ОК</button>
                <button class="danger" @click="$emit('close')">Отмена</button>
            </div>
        </div>
    </div>
</template>

<script>
  import OxInput from "../custom/OxInput";
  import OxSelect from "../custom/OxSelect";
  import OxLoading from "../custom/OxLoading";

  export default {
    name: "register-modal",
    components: {OxLoading, OxSelect, OxInput},
    data() {
      return {
        name: "",
        email: "",
        password: "",
        password_confirmation: "",
        role: "",

        user_types: [
          { text: "Пользователь", value: "customer" },
          { text: "Продавец", value: "vendor" },
          { text: "Поставщик", value: "supplier" },
        ]
      }
    },
    computed: {
      loading() {
        return this.$store.state.loading;
      }
    },
    methods: {
      async register() {
        if (this.validate()) {
          await this.$store.dispatch("register", {
            name: this.name,
            email: this.email,
            password: this.password,
            password_confirmation: this.password_confirmation,
            role: this.role
          });
        }
      },

      validate() {
        return this.name.length !== 0
            && this.email.length !== 0
            && this.password.length !== 0
            && this.password_confirmation.length !== 0
            && this.role.length !== 0
            && this.email.match(/.+@.+\..+/)
      }
    }
  }
</script>

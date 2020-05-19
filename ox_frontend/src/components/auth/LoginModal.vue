<template>
    <div class="overlay">
        <ox-loading v-if="loading" />
        <div class="modal" v-else>
            <div class="modal-header">
                <h1>Войти</h1>
            </div>
            <div class="modal-body">
                <ox-input type="email" label="Эл. почта" v-model="email" required/>
                <ox-input type="password" label="Пароль" v-model="password" required/>
                <p>
                    Нет аккаунта? <span @click="$emit('open')">Зарегистрироваться</span>
                </p>
            </div>
            <div class="modal-footer">
                <button class="success" @click="login">ОК</button>
                <button class="danger" @click="$emit('close')">Отмена</button>
            </div>
        </div>
    </div>
</template>

<script>
  import OxInput from "../custom/OxInput";
  import OxLoading from "../custom/OxLoading";

  export default {
    name: "login-modal",
    components: {OxLoading, OxInput},
    data() {
      return {
        email: "",
        password: ""
      }
    },
    methods: {
      login() {
        if (this.validate()) {
          this.$store.dispatch("login", {
            email: this.email,
            password: this.password
          })
        }
      },

      validate() {
        return this.email.length !== 0
            && this.password.length !== 0
            && this.email.match(/.+@.+\..+/)
      }
    },
    computed: {
      loading() {
        return this.$store.state.loading;
      }
    }
  }
</script>

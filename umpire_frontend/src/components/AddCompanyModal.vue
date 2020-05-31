<template>
    <div class="overlay">
        <ox-loading v-if="loading" />
        <div class="modal" v-else>
            <div class="modal-header">
                <h1>Добавить организацию</h1>
            </div>
            <div class="modal-body">
                <ox-input type="text" label="Название" v-model="name" required/>
                <ox-select type="text" label="Сфера деятельности" :items="scopes" v-model="scope" required/>
                <ox-input type="text" label="Название сферы деятельности" v-model="new_scope" v-if="scope === '0'" @keypress.enter="addScope"/>
            </div>
            <div class="modal-footer">
                <button class="success" @click="addCompany">ОК</button>
                <button class="danger" @click="$emit('closemodal', $event.target)">Отмена</button>
            </div>
        </div>
    </div>
</template>

<script>
    import OxLoading from "./custom/OxLoading";
    import OxInput from "./custom/OxInput";
    import OxSelect from "./custom/OxSelect";
    export default {
      name: "add-company-modal",
      components: {OxSelect, OxInput, OxLoading},
      props: ["scopes"],
      computed: {
        loading() {
          return this.$store.state.loading;
        }
      },
      data() {
        return {
          name: "",
          scope: "",
          new_scope: ""
        }
      },
      methods: {
        async addScope() {
          if (this.new_scope.length !== 0) {
            await this.$store.dispatch("addScope", { name: this.new_scope })
                .then(res => {
                  this.scopes.splice(this.scopes.length-1, 1);
                  this.scopes.push({ text: res.title, value: res.id });
                  this.scopes.push({ text: "+ Добавить", value: 0 });
                });
          }
        },

        async addCompany() {
          if (this.validate()) {
            await this.$store.dispatch("createCompany", {
              name: this.name,
              scope_id: parseInt(this.scope)
            })
          }
        },
        validate() {
          return this.name.length !== 0
              && this.scope.length !== 0
        }
      }
    }
</script>

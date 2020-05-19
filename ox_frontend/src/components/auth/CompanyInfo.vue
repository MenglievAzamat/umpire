<template>
    <div>
        <ox-input label="Название компании" type="text" v-model="company" required />
        <ox-input label="Сфера деятельности" type="text" v-model="scope" required />
        <div class="d-flex justify-end">
            <button class="success mt-1" @click="addInfo">Сохранить</button>
        </div>
    </div>
</template>

<script>
  import OxInput from "../custom/OxInput";
  export default {
    name: "company-info",
    components: {OxInput},
    data() {
      return {
        company: "",
        scope: ""
      }
    },
    methods: {
      async addInfo() {
        if (this.validate()) {
          await this.$store.dispatch("addInfo", {
            company: this.company,
            scope: this.scope
          })
        }
      },

      validate() {
        return this.company.length !== 0
            && this.scope.length !== 0;
      }
    }
  }
</script>

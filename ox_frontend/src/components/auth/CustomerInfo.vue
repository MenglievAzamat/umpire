<template>
    <div>
        <ox-input label="Адрес" type="text" v-model="address" required />
        <div class="d-flex justify-end">
            <button class="success mt-1" @click="addInfo">Сохранить</button>
        </div>
    </div>
</template>

<script>
    import OxInput from "../custom/OxInput";

    export default {
      name: "customer-info",
      components: { OxInput },
      data() {
        return {
          address: ""
        }
      },
      methods: {
        async addInfo() {
          if (this.validate()) {
            await this.$store.dispatch("addInfo", { address: this.address })
          }
        },

        validate() {
          return this.address.length !== 0;
        }
      }
    }
</script>

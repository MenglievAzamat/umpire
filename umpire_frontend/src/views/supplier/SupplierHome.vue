<template>
    <div class="container white stretch-y">
        <ox-loading v-if="loading"/>
        <div class="center" v-else>
            <h1>ПРОДАВЦЫ</h1>

            <hr/>

            <div>
                <div
                    v-for="vendor in vendors"
                    :key="vendor.scope"
                >
                    <ox-companies
                        :label="vendor.scope"
                        :companies="vendor.vendors"
                        :role="12"/>
                    <hr/>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
  import OxLoading from "../../components/custom/OxLoading";
  import OxCompanies from "../../components/custom/OxCompanies";

  export default {
    name: "suplier-home",
    components: {OxCompanies, OxLoading},
    async mounted() {
      await this.$store.dispatch("supplierGetVendors")
          .then(res => {
            this.vendors = res;
          });
    },
    data() {
      return {
        vendors: []
      }
    },
    computed: {
      loading() {
        return this.$store.state.loading;
      }
    }
  }
</script>

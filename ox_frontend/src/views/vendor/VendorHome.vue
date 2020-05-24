<template>
    <div class="container white stretch-y">
        <ox-loading v-if="loading"/>
        <div v-else>
            <div
                v-for="supplier in suppliers"
                :key="supplier.scope"
            >
                <ox-companies
                    :label="supplier.scope"
                    :companies="supplier.suppliers"
                    :role="13" />
                <hr/>
            </div>
        </div>
    </div>
</template>

<script>
  import OxLoading from "../../components/custom/OxLoading";
  import OxCompanies from "../../components/custom/OxCompanies";

  export default {
    name: "vendor-home",
    components: {OxCompanies, OxLoading},
    async mounted() {
      await this.$store.dispatch("vendorGetSuppliers")
          .then(res => {
            this.suppliers = res;
          });
    },
    data() {
      return {
        suppliers: []
      }
    },
    computed: {
      loading() {
        return this.$store.state.loading;
      }
    },
    methods: {
      browseCompany(role, company_id) {
        this.$router.push(`/company/${role}/${company_id}`);
      }
    }
  }
</script>

<template>
    <div class="container white stretch-y">
        <ox-loading v-if="loading" />
        <div class="d-flex justify-center w-100" v-else>
            <customer-info v-if="isCustomer" />
            <company-info v-else />
        </div>
    </div>
</template>

<script>
    import OxInput from "../components/custom/OxInput";
    import CustomerInfo from "../components/auth/CustomerInfo";
    import CompanyInfo from "../components/auth/CompanyInfo";
    import OxLoading from "../components/custom/OxLoading";
    export default {
      name: "add-info",
      components: {OxLoading, CompanyInfo, CustomerInfo, OxInput},
      computed: {
        loading() {
          return this.$store.state.loading;
        },
        user() {
          return this.$store.state.auth.user;
        },
        isCustomer() {
          return this.user.user.role === 11;
        }
      }
    }
</script>

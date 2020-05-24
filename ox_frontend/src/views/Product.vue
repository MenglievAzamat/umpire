<template>
    <div class="container white">
        <ox-loading v-if="loading" />
        <div v-else>
            <h1>Наименование продукта: <span>{{ product.product.name }}</span></h1>
            <h1
                class="mt-1"
                v-for="(info, key) in product.product.info"
                :key="key"
            >
                {{ key }}: <span>{{ info }}</span>
            </h1>

            <hr />

            <ox-companies label="Можно приобрести у:" :companies="product.vendors" />
        </div>
    </div>
</template>

<script>
    import OxLoading from "../components/custom/OxLoading";
    import OxCompanies from "../components/custom/OxCompanies";
    export default {
      name: "product",
      components: {OxCompanies, OxLoading},
      async mounted() {
        await this.$store.dispatch("getProduct", this.$route.params.id).then(res => {
          this.product = res;
        });
      },
      data() {
        return {
          product: {}
        }
      },
      computed: {
        loading() {
          return this.$store.state.loading;
        }
      }
    }
</script>

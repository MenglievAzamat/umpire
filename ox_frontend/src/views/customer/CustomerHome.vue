<template>
    <div class="container white stretch-y">
        <ox-loading v-if="loading" />
        <div class="customer-products" v-else>
            <div
                class="customer-products__product"
                v-for="product in products"
                :key="products.id"
            >
                <h1>{{ product.name }}</h1>
                <hr />
                <div class="info" v-for="(info, key) in product.info">
                    <p><b>{{key}}:</b> {{ info }}</p>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
  import OxLoading from "../../components/custom/OxLoading";
  export default {
    name: "customer-home",
    components: {OxLoading},
    async mounted() {
      await this.$store.dispatch("getProducts").then(res => {
        this.products = res;
      });
    },
    computed: {
      loading() {
        return this.$store.state.loading;
      }
    },
    data() {
      return {
        products: []
      }
    }
  }
</script>

<style scoped lang="scss">
    .customer-products {
        display: flex;
        flex-wrap: wrap;
        width: 100%;

        &__product {
            width: 30%;
            border-radius: 5px;
            border: 1px solid var(--black);
            margin: 1rem;
            padding: 1rem;
            cursor: pointer;
            transition: .25s;

            &:hover {
                transform: scale(1.05);
            }
        }
    }
</style>

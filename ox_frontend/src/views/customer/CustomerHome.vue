<template>
    <div class="container white stretch-y">
        <ox-loading v-if="loading"/>
        <div v-else>
            <div v-for="(value, key) in products" :key="key">
                <h1>{{ key }}</h1>

                <div class="customer-products">
                    <div
                        class="customer-products__product"
                        v-for="product in value"
                        :key="product.id"
                        @click="product.vendors ? showVendors(product.id) : ''"
                    >
                        <div class="no-vendors" v-if="!product.vendors">
                            <p>Нет в продаже</p>
                        </div>
                        <h1>{{ product.name }}</h1>
                        <hr/>
                        <div class="info" v-for="(info, key) in product.info">
                            <p><b>{{key}}:</b> {{ info }}</p>
                        </div>
                    </div>
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
    },
    methods: {
      showVendors(id) {
        this.$router.push(`/customer/product/${id}`);
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
            position: relative;

            .no-vendors {
                position: absolute;
                left: 0;
                right: 0;
                top: 0;
                bottom: 0;
                background: rgba(255, 255, 255, 0.8);
                display: flex;
                align-items: center;
                justify-content: center;

                p {
                    font-size: 3rem;
                    transform: rotate(-20deg);
                    -webkit-text-stroke: 1px sandybrown;
                }
            }

            &:hover {
                transform: scale(1.05);
            }
        }
    }
</style>

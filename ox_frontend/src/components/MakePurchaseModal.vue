<template>
    <div class="overlay">
        <ox-loading v-if="loading" />
        <div class="modal" v-else>
            <div class="modal-header">
                <h1>Сделать заказ</h1>
            </div>
            <div class="modal-body">
                <div class="purchase-products">
                    <div class="product dark">
                        <div class="id">ID</div>
                        <div class="name">Наименование</div>
                        <div class="quantity">Количество</div>
                    </div>
                    <div class="product" v-for="product in products">
                        <div class="id">
                            {{ product.id }}
                        </div>
                        <div class="name">
                            {{ product.name }}
                        </div>
                        <div class="quantity">
                            <ox-input
                                type="number"
                                :max="product.quantity"
                                v-model="product.purchase_quantity"
                                required
                            />
                        </div>
                    </div>
                    <ox-select label="Выберите организацию" :items="companies" v-model="vendor" />
                </div>
            </div>
            <div class="modal-footer">
                <button class="success" @click="purchaseProducts">ОК</button>
                <button class="danger" @click="$emit('close', $event.target)">Отмена</button>
            </div>
        </div>
    </div>
</template>

<script>
    import OxLoading from "./custom/OxLoading";
    import OxInput from "./custom/OxInput";
    import OxSelect from "./custom/OxSelect";
    export default {
      name: "make-purchase-modal",
      components: {OxSelect, OxInput, OxLoading},
      props: [ 'products', 'supplier' ],
      data() {
        return {
          companies: [],
          vendor: null
        }
      },
      computed: {
        loading() {
          return this.$store.state.loading;
        }
      },
      async mounted() {
        this.products.forEach(product => {
          product.purchase_quantity = 0;
        });

        await this.$store.dispatch("getCompanies")
            .then(res => {
              let tmp = [];

              for(let r of res) {
                if (this.supplier.scope === r.scope) {
                  tmp.push({ text: r.name, value: r.id });
                }
              }

              this.companies = tmp;
            });
      },
      methods: {
        async purchaseProducts() {
          if (this.validate()) {
            await this.$store.dispatch("purchaseProducts", {
              vendor: parseInt(this.vendor),
              supplier: this.supplier.id,
              products: this.products
            });
          }
        },

        validate() {
          let valid = false;

          for (let product of this.products) {
            if (product.purchase_quantity === 0) {
              valid = false;
              break;
            } else {
              valid = true;
            }
          }

          valid = !!this.vendor;

          return valid;
        }
      }
    }
</script>

<style scoped lang="scss">
    .purchase-products {
        .product {
            width: 100%;
            display: flex;
            border: 1px solid var(--black);
            border-radius: 5px;

            &.dark {
                background: var(--black);
                color: white;
            }

            .id,
            .name,
            .quantity {
                width: 33.333%;
            }

            .id,
            .name {
                border-right: 1px solid var(--black);
            }

            .id,
            .name,
            .quantity {
                display: flex;
                justify-content: center;
                align-items: center;
            }
        }
    }
</style>

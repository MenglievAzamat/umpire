<template>
    <div class="container white stretch-y">
        <ox-loading v-if="loading" />
        <div class="w-100" v-else>
            <button @click="back">Назад</button>

            <h1 class="mt-2">Название: <span>{{ company.name }}</span></h1>
            <h1>Сфера деятельности: <span>{{ company.scope }}</span></h1>

            <hr />

            <h1>{{ isVendor ? "Поставщики" : "Продавцы" }}</h1>

            <div class="companies">
                <div
                    class="company"
                    v-for="company in (isVendor ? company.suppliers : company.vendors)"
                    :key="company.id"
                    @click="browseCompany(isVendor ? 13 : 12, company.id)"
                >
                    <h2><i>"{{ company.name }}"</i></h2>
                    <h3>Сфера деятельности: <span>{{ company.scope }}</span></h3>
                </div>
            </div>

            <hr />

            <h1>Продукты</h1>

            <h3 style="color:grey" class="mt-2" v-if="company.products.length === 0">Нет продуктов</h3>
            <div class="products mt-2" v-else>
                <div class="head">
                    <div>ID</div>
                    <div>Наименование</div>
                    <div>Информация о продукте</div>
                    <div>Количество товара</div>
                </div>
                <div
                    class="body"
                    v-for="product in company.products"
                    :key="product.id"
                >
                    <div>
                        <p class="mr-1">{{ product.id }}</p>
                        <input type="checkbox" :value="product" v-model="chosen_products" v-if="user.user.role === 12">
                    </div>
                    <div>{{ product.name }}</div>
                    <div class="info">
                        <p v-for="(info, key) in product.info">
                            <b>{{ key }}</b> : {{info}}
                        </p>
                    </div>
                    <div>{{ product.quantity }}</div>
                </div>
            </div>

            <div v-if="company.user_id === user.user.id && user.user.role === 13">
                <button
                    class="mb-2 success"
                    @click="company_modal = true"
                >
                    + Добавить продукт
                </button>
            </div>

            <div v-if="$route.params.role === '13' && user.user.role === 12">
                <button
                    class="mb-2 success "
                    @click="purchase_modal = true"
                >
                    Сделать заказ
                </button>
            </div>
        </div>

        <add-product-modal
            v-if="company_modal"
            :company_id="company.id"
            @close="company_modal = false"
            @refresh="getCompany"
        />
        <make-purchase-modal
            v-if="purchase_modal"
            :supplier="company"
            :products="chosen_products"
            @close="purchase_modal = false"
        />
    </div>
</template>

<script>
    import OxLoading from "../components/custom/OxLoading";
    import AddProductModal from "../components/AddProductModal";
    import MakePurchaseModal from "../components/MakePurchaseModal";
    export default {
      name: "company",
      components: {MakePurchaseModal, AddProductModal, OxLoading},
      async mounted() {
        let params = this.$route.params;

        if (!this.user) {
          await this.$store.dispatch("getUser");
        }

        await this.$store.dispatch("getCompany", {
          role: params.role,
          id: params.id
        }).then(res => {
          this.company = res;
        });
      },
      data() {
        return {
          company: {},
          company_modal: false,
          purchase_modal: false,

          chosen_products: []
        }
      },
      computed: {
        loading() {
          return this.$store.state.loading;
        },
        user() {
          return this.$store.state.auth.user;
        },
        isVendor() {
          return this.$route.params.role === '12';
        }
      },
      methods: {
        back() {
          this.$router.back();
        },

        async browseCompany(role, company_id) {
          await this.$router.replace(`/company/${role}/${company_id}`);

          let params = this.$route.params;

          await this.$store.dispatch("getCompany", {
            role: params.role,
            id: params.id
          }).then(res => {
            this.company = res;
          });
        },

        async getCompany() {
          this.company_modal = false;

          let params = this.$route.params;

          await this.$store.dispatch("getCompany", {
            role: params.role,
            id: params.id
          }).then(res => {
            this.company = res;
          });
        }
      }
    }
</script>

<template>
    <div class="overlay">
        <ox-loading v-if="loading" />
        <div class="modal" v-else>
            <div class="modal-header">
                <h1>Добавить продукт</h1>
            </div>
            <div class="modal-body">
                <ox-input type="text" label="Наименование" v-model="name" required />
                <ox-input type="number" label="Количество" v-model="quantity" required />

                <h2 class="mt-2">Атрибуты продукта</h2>

                <hr />

                <div class="attributes">
                    <p v-if="Object.keys(attributes).length === 0">Нет атрибутов</p>
                    <div class="attribute" v-for="(value, key) in attributes">
                        <p><b>{{ key }}: </b></p>
                        <p>{{ value }}</p>
                    </div>
                </div>

                <hr />

                <div class="attributes-add">
                    <ox-input class="field" type="text" v-model="key" />
                    <ox-input class="field" type="text" v-model="value" />
                    <button class="mx-0 success" @click="addAttribute">+ Добавить атрибут</button>
                </div>
            </div>
            <div class="modal-footer">
                <button class="success" @click="addProduct">ОК</button>
                <button class="danger" @click="$emit('close', $event.target)">Отмена</button>
            </div>
        </div>
    </div>
</template>

<script>
    import OxLoading from "./custom/OxLoading";
    import OxInput from "./custom/OxInput";
    export default {
      name: "add-product-modal",
      props: [ "company_id" ],
      components: {OxLoading, OxInput},
      computed: {
        loading() {
          return this.$store.state.loading;
        }
      },
      data() {
        return {
          key: "",
          value: "",

          name: "",
          attributes: {},
          quantity: 0
        }
      },
      methods: {
        addAttribute() {
          if (this.key.length !== 0 && this.value.length !== 0) {
            this.attributes[this.key] = this.value;
            this.key = "";
            this.value = "";
          }
        },

        async addProduct(e) {
          if (this.validate) {
            await this.$store.dispatch("addProduct", {
              company_id: this.company_id,
              name: this.name,
              quantity: parseInt(this.quantity),
              info: JSON.stringify(this.attributes)
            }).then(() => {
              this.$emit('refresh', e.target);
            });
          }
        },

        validate() {
          return true;
        }
      }
    }
</script>

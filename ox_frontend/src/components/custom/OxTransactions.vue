<template>
    <div>
        <hr/>

        <h1>Запросы</h1>

        <h3 style="color:grey" class="mt-2" v-if="transactions.length === 0">Нет запросов</h3>
        <div class="products mt-2" v-else>
            <div class="head">
                <div>Организация</div>
                <div>Поставщик</div>
                <div>Заказ</div>
                <div>Статус</div>
            </div>
            <div
                class="body"
                v-for="transaction in transactions"
                :key="transaction.id"
            >
                <div>{{ transaction.vendor.name }}</div>
                <div>{{ transaction.supplier.name }}</div>
                <div style="display: block">
                    <p class="mb-1" v-for="product in transaction.products">
                        <b>{{ product.name }}:</b> {{ product.quantity }} шт.
                    </p>
                </div>
                <div>
                    <ox-status
                        :status="transaction.status"
                        @click="action(transaction)"
                    />
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import OxStatus from "./OxStatus";
    export default {
      name: "ox-transactions",
      components: {OxStatus},
      props: [ "transactions", "user" ],
      methods: {
        async action(transaction) {
          if (transaction.status === 0 && this.user.role === 13) {
            await this.$store.dispatch("supplierApproveTransaction", transaction.id)
                .then(res => {
                  location.reload();
                });
          } else if (transaction.status === 1 && this.user.role === 13) {
            await this.$store.dispatch("supplierSendTransaction", transaction.id)
                .then(res => {
                  location.reload();
                });
          } else if (transaction.status === 2 && this.user.role === 12) {
            await this.$store.dispatch("vendorReceiveTransaction", transaction.id)
                .then(res => {
                  location.reload();
                })
          } else if (transaction.status === 3 && this.user.role === 13) {
            await this.$store.dispatch("supplierCloseTransaction", transaction.id)
                .then(res => {
                  location.reload();
                })
          }
        }
      }
    }
</script>

<style scoped lang="scss">
</style>

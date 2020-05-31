<template>
    <div class="container">
        <ox-loading v-if="loading"/>
        <div v-else>
            <div class="image">
                <div class="image-content">
                    <div class="image-content-text">
                        <h1>UMPIRE</h1>
                        <h3>Одна платформа - миллион возможностей</h3>
                    </div>
                </div>
            </div>
            <div class="text">
                <p>Umpire - платформа, объединяющая поставщиков, продавцов и покупателей, и позволяющая им
                    взаимодействовать без особых усилий. Поставщикам реализованы удобные функции, такие как
                    размещение своих организаций на всеобщее обозрение, размещение своей продукции и налаживание
                    поставок всего в пару кликов.</p>
                <p>Продавцы смогут найти здесь себе поставщиков необходимой продукции и оформить оптовые закупки
                    легко и просто. Также, все продукты, купленные через эту платформу, будут выставленны в общий
                    список продукции, тем самым осуществится продвижение.</p>
                <p>Ну и конечно, мы не забыли о покупателях. Для вас здесь построена обширная информационная база
                    магазинов, где вы можете приобрести нужный для вас продукт. Информация о продуктах обновляется
                    каждую секунду, так что вы не пропустите интересные предложения.</p>
            </div>
        </div>
    </div>
</template>

<script>
  import OxLoading from "../components/custom/OxLoading";

  export default {
    name: 'home',
    components: {OxLoading},
    async mounted() {
      if (localStorage.token) {
        if (!this.$store.state.auth.user) {
          await this.$store.dispatch("getUser").then(user => {
            this.user = user;
          });
        } else {
          this.user = this.$store.state.auth.user;
        }

        if (this.user.user.role === 11) {
          await this.$router.push("/customer");
        } else if (this.user.user.role === 12) {
          await this.$router.push("/vendor");
        } else if (this.user.user.role === 13) {
          await this.$router.push("/supplier");
        }
      }
    },
    data() {
      return {
        user: null
      }
    },
    computed: {
      loading() {
        return this.$store.state.loading;
      }
    }
  }
</script>

<style scoped lang="scss">
    .text {
        padding: 4rem 2rem;
        display: flex;
        justify-content: space-between;

        p {
            width: 30%;
            font-size: 1.1rem;
        }
    }

    .container {
        background: white;
        padding: 0;
    }

    .image {
        background: url("../assets/img/home-cover.jpeg");
        background-size: cover;
        width: 100%;
        height: 20rem;
        position: relative;

        &-content {
            position: absolute;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.75);
            display: flex;
            justify-content: center;
            align-items: center;

            &-text {
                text-align: center;
                color: white;
                margin-top: 4rem;

                h1 {
                    font-size: 7rem;
                }

                h3 {
                    font-size: 2rem;
                    -webkit-text-stroke: 1px black;
                }
            }
        }
    }
</style>

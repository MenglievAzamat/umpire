<template>
    <div class="container white stretch-y">
        <ox-loading v-if="loading" />
        <div class="w-100" v-else>
            <div class="d-flex">
                <h1 class="mr-1">Имя: </h1>
                <h1 class="normal">{{ user.user.name }}</h1>
            </div>
            <div class="d-flex mt-2">
                <h1 class="mr-1">Email: </h1>
                <h1 class="normal">{{ user.user.email }}</h1>
            </div>

            <hr />

            <h1>Мои организации</h1>

            <div class="companies">
                <div
                    class="company"
                    v-for="company in companies"
                    :key="company.id"
                >
                    <h2><i>"{{ company.name }}"</i></h2>
                    <h3>Сфера деятельности: <span>{{ company.scope }}</span></h3>
                </div>
            </div>
            <button class="success">Добавить организацию</button>

            <hr />

            <button class="mt-2"  @click="logout">LOGOUT</button>
        </div>
    </div>
</template>

<script>
    import OxLoading from "../components/custom/OxLoading";
    import OxInput from "../components/custom/OxInput";
    export default {
      name: "profile",
      components: {OxInput, OxLoading},
      async created() {
        if (!this.$store.state.auth.user) {
          await this.$store.dispatch("getUser").then(user => {
            this.user = user;
          })
        } else {
          this.user = this.$store.state.auth.user;
        }
      },
      async mounted() {
        if (!localStorage.token) {
          await this.$router.push("/404");
        } else {
          await this.$store.dispatch("getCompanies");
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
        },
        companies() {
          return this.$store.state.user.companies;
        }
      },
      methods: {
        async logout() {
          await this.$store.dispatch("logout");
        }
      },

    }
</script>

<style scoped lang="scss">
    .companies {
        display: flex;
        flex-wrap: wrap;

        .company {
            padding: 1rem;
            margin: 1rem;
            border: 1px solid #333333;
            border-radius: 10px;
            transition: 0.25s;
            cursor: pointer;
            width: 30%;

            &:hover {
                box-shadow: -4px 4px 5px -3px rgba(0, 0, 0, 0.5);
            }

            h3 {
                margin-top: 1rem;
                font-weight: bold;

                span {
                    font-weight: 300;
                }
            }
        }
    }
</style>

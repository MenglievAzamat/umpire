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
            <div class="d-flex" v-if="user.user.role === 11">
                <h1 class="mr-1">Адрес: </h1>
                <h1 class="normal">{{ user.info.address }}</h1>
            </div>
            <div v-else>
                <div class="d-flex">
                    <h1 class="mr-1">Название компании: </h1>
                    <h1 class="normal">{{ user.info.company }}</h1>
                </div>
                <div class="d-flex mt-2">
                    <h1 class="mr-1">Сфера деятельности: </h1>
                    <h1 class="normal">{{ user.info.scope }}</h1>
                </div>
            </div>


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
      async mounted() {
        if (!localStorage.token) {
          await this.$router.push("/404");
        }
      },
      computed: {
        loading() {
          return this.$store.state.loading;
        },
        user() {
          return this.$store.state.auth.user;
        }
      },
      methods: {
        async logout() {
          await this.$store.dispatch("logout");
        }
      },

    }
</script>

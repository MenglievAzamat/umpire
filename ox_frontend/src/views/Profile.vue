<template>
    <div class="container white stretch-y">
        <ox-loading v-if="loading"/>
        <div class="w-100" v-else>
            <div class="d-flex">
                <h1 class="mr-1">Имя: </h1>
                <h1 class="normal">{{ user.user.name }}</h1>
            </div>
            <div class="d-flex mt-2">
                <h1 class="mr-1">Email: </h1>
                <h1 class="normal">{{ user.user.email }}</h1>
            </div>

            <div v-if="user.user.role !== 11">
                <hr/>

                <h1>Мои организации</h1>

                <div class="companies">
                    <div
                        class="company"
                        v-for="company in companies"
                        :key="company.id"
                        @click="browseCompany(user.user.role, company.id)"
                    >
                        <h2><i>"{{ company.name }}"</i></h2>
                        <h3>Сфера деятельности: <span>{{ company.scope }}</span></h3>
                    </div>
                </div>
                <button class="success" @click="addCompany">Добавить организацию</button>
            </div>

            <hr/>

            <button class="mt-2" @click="logout">LOGOUT</button>

            <add-company-modal :scopes="scopes" v-if="modal" @closemodal="modal = false"/>
        </div>
    </div>
</template>

<script>
  import OxLoading from "../components/custom/OxLoading";
  import OxInput from "../components/custom/OxInput";
  import AddCompanyModal from "../components/AddCompanyModal";

  export default {
    name: "profile",
    components: {AddCompanyModal, OxInput, OxLoading},
    async created() {
      if (!this.$store.state.auth.user) {
        await this.$store.dispatch("getUser").then(user => {
          this.user = user;
        })
      } else {
        this.user = this.$store.state.auth.user;
      }

      if (!localStorage.token) {
        await this.$router.push("/404");
      } else {
        if (this.user.user.role !== 11) {
          await this.$store.dispatch("getCompanies");
          await this.$store.dispatch("getScopes").then(res => {
            this.scopes = res;
          });
        }
      }
    },
    data() {
      return {
        user: null,
        scopes: [],

        modal: false
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
      },
      browseCompany(role, company_id) {
        this.$router.push(`/company/${role}/${company_id}`);
      },

      addCompany() {
        this.modal = true;
      }
    },

  }
</script>

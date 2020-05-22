import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../modules/axios'

// MODULES
import auth from "./modules/auth"
import user from "./modules/user"
import company from "./modules/company"
import customer from "./modules/customer";

if (localStorage.token) {
    axios.defaults.headers.common["Authorization"] = localStorage.token;
}

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
      loading: false
  },
  mutations: {
      setLoading(state, value) {
          if (!value) {
              setTimeout(() => state.loading = value, 1000);
          } else {
              state.loading = value;
          }
      }
  },
  modules: {
      auth,
      user,
      company,
      customer
  }
})

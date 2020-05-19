import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../modules/axios'

// MODULES
import auth from "./modules/auth"

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
          state.loading = value;
      }
  },
  modules: {
      auth
  }
})

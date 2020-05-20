import axios from '../../modules/axios'

export default {
    state: {
        companies: []
    },
    mutations: {
        setCompanies(state, value) {
            state.companies = value;
        }
    },
    actions: {
        async getCompanies({ commit }) {
            commit("setLoading", true);

            await axios.get("/user/companies").then(resp => {
                commit("setCompanies", resp.data);
                commit("setLoading", false);
            });
        }
    }
}

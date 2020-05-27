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

            return await axios.get("/user/companies").then(resp => {
                commit("setCompanies", resp.data);
                commit("setLoading", false);
                return resp.data;
            });
        },

        async getTransactions({ commit }) {
            commit("setLoading", true);

            return await axios.get("/user/transactions")
                .then(resp => {
                    commit("setLoading", false);
                    return resp.data;
                });
        }
    }
}

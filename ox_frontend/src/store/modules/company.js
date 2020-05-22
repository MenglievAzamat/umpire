import axios from "../../modules/axios"
import vars from "./global-vars"
import auth from "./auth"

export default {
    state: {

    },
    mutations: {

    },
    actions: {
        async getCompany({ commit }, data) {
            commit("setLoading", true);

            let role = vars.state.roles[data.role];

            return await axios.get(`/${role}/company/${data.id}`)
                .then(resp => {
                    commit("setLoading", false);
                    return resp.data;
                })
        },

        async createCompany({ commit }, data) {
            let role = auth.state.user.user.role === 12 ? "vendor" : auth.state.user.user.role === 13 ? "supplier" : "";

            commit("setLoading", true);

            await axios.post(`${role}/new`, data)
                .then(resp => {
                    commit("setLoading", false);
                    location.reload();
                });
        },

        async getScopes({ commit }) {
            commit("setLoading", true);

            return await axios.get(`scopes`)
                .then(resp => {
                    let result = [];

                    commit("setLoading", false);
                    resp.data.forEach(scope => {
                       result.push({
                           text: scope.title,
                           value: scope.id
                       })
                    });

                    result.push({ text: "+ Добавить", value: 0 });

                    return result;
                })
        },
        async addScope({ commit }, data) {
            commit("setLoading", true);

            return await axios.post("/scopes/new", data)
                .then(resp => {
                    commit("setLoading", false);
                    return resp.data;
                })
        }
    }
}

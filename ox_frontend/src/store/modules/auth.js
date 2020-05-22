import axios from "../../modules/axios"

export default {
    state: {
        user: null
    },
    mutations: {
        setUser(state, value) {
            state.user = value;
        }
    },
    actions: {
        async validateToken({ commit }) {
            commit("setLoading", true);

            await axios.get("/user/validate").then(() => {
                commit("setLoading", false);
            })
        },

        async getUser({ commit }) {
            commit("setLoading", true);

            return await axios.get("/user/current").then(resp => {
                commit("setUser", resp.data);

                commit("setLoading", false);
                return resp.data;
            });
        },

        async login({ commit }, data) {
            commit("setLoading", true);

            await axios.post("/user/login", data).then(resp => {
                localStorage.token = `${resp.data.tokenType} ${resp.data.accessToken}`;
                location.href = "/profile";
                commit("setLoading", false);
            })
        },

        async register({ commit }, data) {
            commit("setLoading", true);

            await axios.post("/user/register", data).then(resp => {
                localStorage.token = `${resp.data.tokenType} ${resp.data.accessToken}`;
                location.href = "/profile";
                commit("setLoading", false);
            });
        },

        async logout({ commit }) {
            commit("setLoading", true);

            await axios.get("/user/logout").then(() => {
                localStorage.removeItem("token");
                delete axios.defaults.headers.common["Authorization"];
                location.href = "/";
            })
        }
    }
}

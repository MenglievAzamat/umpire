import axios from "../../modules/axios"

export default {
    actions: {
        async supplierGetVendors({ commit }) {
            commit("setLoading", true);

            return await axios.get("/supplier/vendors")
                .then(resp => {
                    commit("setLoading", false);
                    return resp.data;
                });
        },

        async supplierApproveTransaction({ commit, dispatch }, id) {
            if (confirm("Вы подтверждаете начало сборки заказа?")) {
                commit("setLoading", true);

                return await axios.put(`/supplier/transaction/${id}/approve`)
                    .then(async () => {
                        commit("setLoading", false);
                        return await dispatch("getTransactions").then(res => {
                            return res;
                        });
                    })
            }
        },

        async supplierSendTransaction({ commit, dispatch }, id) {
            if (confirm("Вы подтверждаете отправку заказа?")) {
                commit("setLoading", true);

                return await axios.put(`/supplier/transaction/${id}/send`)
                    .then(async () => {
                        commit("setLoading", false);
                        return await dispatch("getTransactions").then(res => {
                            return res;
                        });
                    })
            }
        },

        async supplierCloseTransaction({ commit, dispatch }, id) {
            if (confirm("Вы подтверждаете, что транзакция завершена?")) {
                commit("setLoading", true);

                return await axios.put(`/supplier/transaction/${id}/close`)
                    .then(async () => {
                        commit("setLoading", false);
                        return await dispatch("getTransactions").then(res => {
                            return res;
                        });
                    })
            }
        },

        async addProduct({ commit }, data) {
            commit("setLoading", true);

            await axios.post("/supplier/products/add", data)
                .then(() => {
                    commit("setLoading", false);
                })
        }
    }
}

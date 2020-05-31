import axios from "../../modules/axios"

export default {
    actions: {
        async vendorGetSuppliers({ commit }) {
            commit("setLoading", true);

            return await axios.get("/vendor/suppliers")
                .then(resp => {
                    commit("setLoading", false);
                    return resp.data;
                });
        },

        async purchaseProducts({ commit }, data) {
            commit("setLoading", true);

            await axios.post("/vendor/purchase", data)
                .then(resp => {
                    alert("Запрос на доставку создан, ожидайте подтверждения поставщика.");
                    commit("setLoading", false);
                })
        },

        async vendorReceiveTransaction({ commit, dispatch }, id) {
            if (confirm("Подтверждаете принятие заказа?")) {
                commit("setLoading", true);

                return await axios.put(`/vendor/transaction/${id}/receive`)
                    .then(async () => {
                        commit("setLoading", false);
                        return await dispatch("getTransactions")
                            .then(res => {
                                return res;
                            });
                    });
            } else {
                return await axios.put(`/vendor/transaction/${id}/reject`)
                    .then(async () => {
                        commit("setLoading", false);
                        return await dispatch("getTransactions")
                            .then(res => {
                                return res;
                            });
                    });
            }
        }
    }
}

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
        }
    }
}

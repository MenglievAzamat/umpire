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
        }
    }
}

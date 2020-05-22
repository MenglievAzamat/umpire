import axios from "../../modules/axios"

export default {
    actions: {
        async getProducts({ commit }) {
            commit("setLoading", true);

            return await axios.get("/customer/products")
                .then(resp => {
                    commit("setLoading", false);
                    return resp.data;
                });
        }
    }
}

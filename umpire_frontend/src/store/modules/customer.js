import axios from "../../modules/axios"

export default {
    actions: {
        async getProducts({ commit }) {
            commit("setLoading", true);

            return await axios.get("/customer/products")
                .then(resp => {
                    let products = {};

                    for (let product of resp.data) {
                        console.log(product);
                        if (products[product.scope]) {
                            products[product.scope].push(product);
                        } else {
                            products[product.scope] = [ product ];
                        }
                    }

                    console.log(products);

                    commit("setLoading", false);
                    return products;
                });
        },

        async getProduct({ commit }, id) {
            commit("setLoading", true);

            return await axios.get(`/product/${id}`)
                .then(resp => {
                    commit("setLoading", false);
                    return resp.data;
                })
        }
    }
}

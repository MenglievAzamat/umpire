import axios from "axios";
import store from "../store";

const instance = axios.create({
    baseURL: "http://ox.local/api"
});

instance.interceptors.response.use(null, error => {
    alert(error.response.data.message);

    if (error.response.status) {
        if (error.response.status === 401) {
            localStorage.removeItem("token");
            location.href = "/";
        }
    }

    store.commit("setLoading", false);

    return Promise.reject(error);
});

export default instance;

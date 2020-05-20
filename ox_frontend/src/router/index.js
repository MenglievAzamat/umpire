import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Profile from "../views/Profile"
import NotFound from "../views/NotFound"
import VendorHome from "../views/vendor/VendorHome";

Vue.use(VueRouter);

const routes = [
    {
        path: "/",
        name: "Home",
        component: Home
    },
    {
        path: "/profile",
        name: "Profile",
        component: Profile
    },

    // VENDOR
    {
        path: "/vendor",
        name: "VendorHome",
        component: VendorHome
    },

    // SUPPLIER
    {
        path: "/supplier",
        name: "SupplierHome",
        component: VendorHome
    },

    // CUSTOMER
    {
        path: "/customer",
        name: "CustomerHomer",
        component: VendorHome
    },

    // GLOBAL ROUTES
    {
        path: "*",
        name: "404",
        component: NotFound
    }
];

const router = new VueRouter({
    mode: "history",
    base: process.env.BASE_URL,
    routes
});

export default router

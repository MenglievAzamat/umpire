import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Profile from "../views/Profile"
import NotFound from "../views/NotFound"
import VendorHome from "../views/vendor/VendorHome";
import Company from "../views/Company";
import SupplierHome from "../views/supplier/SupplierHome";
import CustomerHome from "../views/customer/CustomerHome";

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
    {
        path: "/company/:role/:id",
        name: "Company",
        component: Company
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
        component: SupplierHome
    },

    // CUSTOMER
    {
        path: "/customer",
        name: "CustomerHomer",
        component: CustomerHome
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

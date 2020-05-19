import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Profile from "../views/Profile"
import NotFound from "../views/NotFound"
import AddInfo from "../views/AddInfo"

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
        path: "/add/info",
        name: "AddInfo",
        component: AddInfo
    },
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

<template>
    <div id="app">
        <Navbar/>
        <div class="main-container">
            <router-view class="pt-6"/>
        </div>
        <Footer class="footer"/>
    </div>
</template>

<script>
  import Navbar from "./components/Navbar";
  import Footer from "./components/Footer";

  export default {
    name: "app",
    components: {Footer, Navbar},
    created() {
      if (localStorage.token && !this.$store.state.auth.user) {
        this.$store.dispatch("getUser");
      }
    }
  }
</script>

<style scoped lang="scss">
    .pt-6 {
        padding-top: 6rem;
    }
</style>

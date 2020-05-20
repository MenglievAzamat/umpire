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
    async mounted() {
      if (localStorage.token) {
        await this.$store.dispatch("validateToken");
      }
    }
  }
</script>

<style scoped lang="scss">
    .pt-6 {
        padding-top: 6rem;
    }
</style>

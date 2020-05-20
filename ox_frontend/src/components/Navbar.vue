<template>
    <div class="main-container">
        <div class="container" :class="{'logged' : loggedIn}">
            <button @click="goToHome">Домой</button>
            <Logo class="logo" color="white"/>
            <button @click="openLoginModal" v-if="!loggedIn">Войти</button>
            <button @click="goToProfile" v-else>Профиль</button>

            <login-modal
                v-if="login_modal"
                @close="closeLoginModal"
                @open="openRegisterModal"
            />
            <register-modal
                v-if="register_modal"
                @close="openLoginModal"
            />
        </div>
    </div>
</template>

<script>
  import Logo from "./Logo";
  import LoginModal from "./auth/LoginModal";
  import RegisterModal from "./auth/RegisterModal";

  export default {
    name: "navbar",
    components: {RegisterModal, LoginModal, Logo},
    data() {
      return {
        login_modal: false,
        register_modal: false,
      }
    },
    computed: {
      loggedIn() {
        return !!localStorage.token;
      }
    },
    methods: {
      openLoginModal() {
        this.login_modal = true;
        this.register_modal = false;
      },
      closeLoginModal() {
        this.login_modal = false;
      },

      openRegisterModal() {
        this.login_modal = false;
        this.register_modal = true;
      },

      goToProfile() {
        this.$router.push("/profile");
      },
      goToHome() {
        this.$router.push("/");
      }
    }
  }
</script>

<style scoped lang="scss">
    .logged {
        justify-content: flex-end;

        .logo {
            left: 5rem;
            transform: unset;
        }
    }

    .logo {
        width: 10rem;
        height: 10rem;
        background: var(--black);
        border: 2px solid white;
        border-radius: 50%;
        position: absolute;
        left: 50%;
        top: 0;
        z-index: 2;
        overflow: hidden;
        transform: translateX(-50%);
    }

    .main-container {
        background: var(--black);
        animation: bounce-top .5s .5s ease-in-out;
    }

    @keyframes bounce-top {
        0% {
            margin-top: -10rem;
        }
        100% {
            margin-top: 0;
        }
    }
</style>

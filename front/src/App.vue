<template>
<div id="root">
  <noscript>
    <strong>We're sorry but the app doesn't work properly without JavaScript enabled. Please enable it to continue.</strong>
  </noscript>
  <div id="app" class="flex" v-if="loaded">
    <TheNavigation :class="{'wrapped': isNavbarWrapped}"/>
    <div class="main-container row column" :class="{'navbarWrapped': isNavbarWrapped}">
      <TheHeader :username="username" @toggleNavbar="toggleNavbar"/>
      <main class="flex jc-center">
        <router-view/>
      </main>
    </div>
  </div>
  <div class="tman flex column ai-center jc-center" v-else>
    <img src="@/assets/logo/logo_tman-horizontal.svg" alt="logo tman">
    <h3>Chargement de votre espace...</h3>
  </div>
</div>
</template>

<script>
import TheHeader from './components/TheHeader.vue';
import TheNavigation from './components/TheNavigation.vue';
export default {
  components: { TheNavigation, TheHeader },
  data() {
    return {
      username: "Jean-Charles",
      isNavbarWrapped: false, // TODO : méthode pour récupérer les préférences en cookie
      loaded: true,
    };
  },
  mounted() {
    setTimeout(() => {
      this.loaded = true;
    }, 500)
  },
  methods: {
    toggleNavbar() {
      this.isNavbarWrapped = !this.isNavbarWrapped
    },
  },
};
</script>

<style lang="scss">
@import '~@/assets/scss/main.scss';
#root {
  width: 100vw;
  height: 100vh;
}
</style>

<template>
  <header class="flex ai-center">
    <BurgerMenu @toggleNavbar="toggleNavbar($event)"/>
    <div class="header-container flex jc-end ai-center">
      <h1>{{$route.name}}</h1>
      <div class="search btn rounded row" :class="{'focus': isFocused}" @click="focusSearch">
        <Loupe/>
        <hr>
        <input type="text" ref="search" name="search" id="search-input" placeholder="Rechercher" v-model="search" @focus="isFocused = true" @blur="isFocused = false">
      </div>
      <div class="user flex jc-end ai-center">
        <button></button>
        <p>{{username}}</p>
        <img class="avatar btn rounded" v-if="avatar" src="" alt="avatar">
        <div class="avatar btn rounded centered" v-else>{{username[0]}}</div>
      </div>
    </div>
  </header>
</template>

<script>
import BurgerMenu from './svg/BurgerMenu.vue'
import Loupe from './svg/Loupe.vue'
export default {
  name: "TheHeader",
  props: {
    username: {
      type: String,
      required: true,
      default: "Jean-Michel",
    },
  },
  data() {
    return {
      search: "",
      avatar: null,
      isFocused: false,
    }
  },
  components: {
    BurgerMenu,
    Loupe,
  },
  methods: {
    focusSearch() {
      this.$refs.search?.focus()
    },
    toggleNavbar(event) {
      this.$emit("toggleNavbar", event)
    }
    // TODO : méthode déconnexion
  },
}
</script>
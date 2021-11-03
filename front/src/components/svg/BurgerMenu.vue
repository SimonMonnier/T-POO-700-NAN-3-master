<template>
  <div class="burger-menu svg centered">
    <input class="d-none" type="checkbox" name="burger-menu" id="check-burger-menu" v-model="checkbox">
    <label for="check-burger-menu">
      <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 20 17.143">
        <path id="Tracé_6137" data-name="Tracé 6137" d="M3,5.429A1.429,1.429,0,0,1,4.429,4H21.571a1.429,1.429,0,1,1,0,2.857H4.429A1.429,1.429,0,0,1,3,5.429Zm0,7.143a1.429,1.429,0,0,1,1.429-1.429H21.571a1.429,1.429,0,1,1,0,2.857H4.429A1.429,1.429,0,0,1,3,12.571Zm0,7.143a1.429,1.429,0,0,1,1.429-1.429H13a1.429,1.429,0,0,1,0,2.857H4.429A1.429,1.429,0,0,1,3,19.714Z" transform="translate(-3 -4)" fill-rule="evenodd"/>
      </svg>
    </label>
  </div>
</template>

<script>
export default {
  name: "BurgerMenu",
  data() {
    return {
      checkbox: false,
    }
  },
  watch: {
    checkbox() {
      this.$emit("toggleNavbar", this.checkbox)
    }
  }
}
</script>
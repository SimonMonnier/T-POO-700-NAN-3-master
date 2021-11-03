<template>
  <div class="welcome flex jc-space-around ai-center">
    <div class="welcome-container flex column jc-center ai-center">
      <h1>Bienvenue</h1>
      <h2>Michel</h2>
      <TheMagicButton link="/dashboard" content="Débuter la surveillance" color="blue" />
    </div>
    <TheGothamSkyline />
  </div>
</template>

<script>
import TheGothamSkyline from '../components/TheGothamSkyline.vue'
import TheMagicButton from '../components/TheMagicButton.vue'

export default {
  name: "Bienvenue",
	components: {
    TheMagicButton,
    TheGothamSkyline,
  },
}
</script>
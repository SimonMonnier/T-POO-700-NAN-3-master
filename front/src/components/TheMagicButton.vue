<template>
  <div v-if="type == 'phone'" class="magic-button phone btn rounded flex ai-center">
    <IconPhone />
    <div class="flex centered"><p>{{content}}</p></div>
  </div>
  <!-- <a v-if="type == 'phone'" :href="link" class="magic-button phone btn rounded flex ai-center">
    <IconPhone />
    <div class="flex centered"><p>{{content}}</p></div>
  </a> -->
  <a v-else-if="type == 'survey'" target="_blank" class="magic-button survey btn rounded flex ai-center" :class="color">
    <IconSurvey />
    <div class="flex centered play"><p>{{content}}</p></div>
  </a>
  <a v-else-if="type == 'survey-done'" target="_blank" class="magic-button survey btn rounded flex ai-center" :class="color">
    <IconSurveyDone />
    <div class="flex centered play"><p>{{content}}</p></div>
  </a>
  <a v-else-if="type == 'survey-cancelled'" target="_blank" class="magic-button survey btn rounded flex ai-center" :class="color">
    <IconSurveyCancelled />
    <div class="flex centered play"><p>{{content}}</p></div>
  </a>
  <router-link v-else :to="link" class="magic-button btn rounded flex ai-center">
    <IconPlay />
    <div class="flex centered play"><p>{{content}}</p></div>
  </router-link>
</template>

<script>
import IconPlay from "./svg/IconPlay.vue";
import IconPhone from "./svg/IconPhone.vue";
import IconSurvey from './svg/IconSurvey.vue';
import IconSurveyDone from './svg/IconSurveyDone.vue';
import IconSurveyCancelled from './svg/IconSurveyCancelled.vue';

export default {
  name: "MagicButton",
  props: {
    link: {
      type: String,
      required: true,
      default: "/"
    },
    content: {
      type: String,
      required: true,
      default: "Accueil"
    },
    color: {
      type: String,
      required: true,
      default: "blue"
    },
    type: {
      type: String,
      required: false,
      default: ""
    },
  },
  components: {
    IconPlay,
    IconPhone,
    IconSurvey,
    IconSurveyDone,
    IconSurveyCancelled,
  }
}
</script>
<template>
  <router-link :to="link" class="flex jc-start ai-center">
    <IconSurvey v-if="type == 'survey'"/>
    <IconBousole v-if="type == 'bousole'"/>
    <IconNewLead v-if="type == 'utilisateurs'"/>
    <IconKPI1 v-if="type == ''"/>
    <IconKPI2 v-if="type == 'dashboard'"/>
    <IconKPI3 v-if="type == ''"/>

    <p>{{content}}</p>
  </router-link>
</template>
<script>
import IconSurvey from './svg/IconSurvey.vue'
import IconBousole from './svg/IconBousole.vue'
import IconNewLead from './svg/IconNewLead.vue'
import IconKPI1 from './svg/IconKPI1.vue'
import IconKPI2 from './svg/IconKPI2.vue'
import IconKPI3 from './svg/IconKPI3.vue'
export default {
  name: "TheLink",
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
    type: {
      type: String,
      required: true,
      default: ""
    },
  },
	components: {
    IconSurvey,
    IconBousole,
    IconNewLead,
    IconKPI1,
    IconKPI2,
    IconKPI3,
  },
}
</script>
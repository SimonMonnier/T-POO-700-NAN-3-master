<template>
  <div class="navigation flex jc-center ai-start">
    <div class="nav-bar flex column jc-center ai-start">
      <router-link to="/" class="nav-header flex ai-center">
        <img class="tman-vignette" src="@/assets/logo/logo_tman-vignette.svg" alt="tman-vignette">
        <img class="tman-typo" src="@/assets/logo/logo_tman-typo.svg" alt="tman-vignette">
      </router-link>
      <div class="nav-links flex column ai-start">
        <!-- <TheLink link="/" type="home" content="BIENVENUE"/> -->
        <TheLink link="/dashboard" type="dashboard" content="DASHBOARD"/>
        <TheLink link="/utilisateurs" type="utilisateurs" content="UTILISATEURS"/>
        <!-- <TheLink link="#" type="reorienter" content="RÉORIENTER"/>
        <TheLink link="#" type="nouveau-lead" content="NOUVEAU&nbsp;LEAD"/> -->
      </div>
      <hr>
      <div class="nav-links flex column ai-start">
        <TheLink link="/tests" type="survey" content="Tests"/>
        <!-- <TheLink link="#" type="kpi-2" content="KPI&nbsp;2"/> -->
        <TheLink link="/heures-de-travail" type="bousole" content="HEURES DE TRAVAIL"/>
      </div>
    </div>
  </div>
</template>

<script>
import TheLink from './TheLink.vue'
export default {
  name: "TheNavigation",
  components: {
    TheLink,
  },
}
</script>
<template>
  <div class="working-times">
    <div class="card content-header row">
      <div class="username row">
        <span class="centered circle-btn">{{"Jean-Michel"[0]}}</span>
        <p>Jean-Michel</p>
      </div>
      <div class="hours-summary row">
        <button class="clock circle-btn"></button>
        <div class="hours-worked">
          <p>13h37</p>
          <p>Cette semaine</p>
        </div>
      </div>
    </div>
    <div class="card day-picker">
      <div class="day-picker-header row">
        <div class="row">
          <p>Horaires</p>
          <div class="row">
            <button>&lt;</button>
            <hr>
            <div class="row">
              <span class="calendar">&nbsp;</span>
              <p>Semaine du : <strong>25 oct. 2021</strong></p>
            </div>
            <hr>
            <button>></button>
          </div>
        </div>
        <div class="display-method row">
          <input class="d-none" value="day" type="radio" name="radio-day" id="radio-day" v-model="displayMethod">
          <label for="radio-day">Jour</label>
          <input class="d-none" value="week" type="radio" name="radio-week" id="radio-week" v-model="displayMethod">
          <label for="radio-week">Semaine</label>
          <input class="d-none" value="all" type="radio" name="radio-all" id="radio-all" v-model="displayMethod">
          <label for="radio-all">Global</label>
        </div>
      </div>
      <hr>
      <div class="day-picker-content"></div>
    </div>
    <div class="card working-times-list">
      <div class="day-selected">Heures de travail pour le <strong>Lun, 25 oct. 2021</strong></div>
      <div class="list">
        <TheWorkingTimes v-for="n in 20" :key="n"/>
      </div>
    </div>
  </div>
</template>

<script>
import TheWorkingTimes from '../components/TheWorkingTimes.vue';
export default {
  name: 'WorkingTimes',
  data() {
    return {
      userid: null,
      username: "Jean-Michel",
      displayMethod: "week",
    };
  },
  components: {
    TheWorkingTimes,
  },
  beforeMount() {
    if (!this.$route.params.userid?.match(/^\d+$/)) {
      console.log(this.$route.params.userid);
      // alert("Erreur dans l'URL, retour à l'accueil");
      // this.$router.push('/');
    }
  },
  mounted() {
    console.log("user id : ", parseInt(this.$route.params.userid));
    this.userid = parseInt(this.$route.params.userid);
  },
};
</script>

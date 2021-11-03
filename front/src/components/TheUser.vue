<template>
  <div class="grid fr-2-3-1" @click="goToUsersDetails(id)">
    <p class="username">{{ username }}</p>
    <button class="user-btn state-clock row" @click.stop="switchClock(id)">
      <p>État de travail :</p>
      <p :style="clock ? 'color: rgb(77, 192, 27)' : 'color: rgb(234,86,86)'">{{clock ? "Actif" : "Inactif"}}</p>
      <button class="circle-btn">
        <IconPause v-if="clock"/>
        <IconPlayInside v-else/>
      </button>
    </button>
    <div class="actions">
      <button class="circle-btn" @click.stop="this.$emit('modalUpdateUser', id)">
        <IconEdit />
      </button>
      <button class="circle-btn" @click.stop="deleteUser(id)">
        <IconDelete />
      </button>
      <button class="circle-btn" @click.stop="goToUsersDetails(id)">
        <IconArrow />
      </button>
    </div>
  </div>
</template>

<script>
import IconEdit from './svg/IconEdit.vue';
import IconDelete from './svg/IconDelete.vue';
import IconPlayInside from './svg/IconPlayInside.vue';
import IconPause from './svg/IconPause.vue';
import IconArrow from './svg/IconArrow.vue';

export default {
  components: {
    IconDelete,
    IconEdit,
    IconPlayInside,
    IconPause,
    IconArrow,
  },
  name: "TheUser",
  props: {
    username: String,
    id: Number,
  },
  data() {
    return {
      users: null,
      user: {
        username: "",
        email: "",
        id: 0
      },
      clock: false
    }
  },
  methods: {
    switchClock(userId) {
      console.log("Switching clock for user : ", userId);
    },
    async deleteUser(userId) {
      await this.$axiosConfigInstance
        .delete(`/api/users/${userId}`)
        .then(() => {
          this.$emit('removeUser', userId)
        })
        .catch((error) => {
          console.log(error);
        });
    },
    goToUsersDetails(userId) {
      console.log("Go to user's details : ", userId);
      this.$router.push(`/heures-de-travail/${userId}`)
    },
  },
}
</script>
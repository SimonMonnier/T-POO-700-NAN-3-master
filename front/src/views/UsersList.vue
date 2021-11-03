<template>
  <div class="user-list">
    <div class="content-head row">
      <p>Liste des utilisateurs</p>
      <button class="user-btn head flex ai-center" @click="action = 'add'; modal = true">
        <p>Ajouter un utilisateur</p>
        <IconAdd class="circle-btn" />
      </button>
    </div>
    <div class="content" v-if="users">
        <TheUser v-for="user in users" :key="user.id" class="card flex centered user" :username="user.username" :id="user.id" @modalUpdateUser="modalUpdateUser" @removeUser="removeUser"/>
    </div>
    <ModalUser v-if="modal" :action="action" :user="user" @add="addUser" @update="updateUser" @close="modal = false"/>
  </div>
</template>

<script>
import ModalUser from '../components/ModalUser.vue';
import IconAdd from '../components/svg/IconAdd.vue';
import TheUser from '../components/TheUser.vue';
export default {
  name: 'TheUsersList',
  components: {
    TheUser,
    ModalUser,
    IconAdd,
  },
  data() {
    return {
      users: [],
      modal: false,
      action: '',
      user: null,
    }
  },
  async mounted() {
    this.users = await this.getUsers();
  },
  methods: {
    async getUsers() {
      return await this.$axiosConfigInstance
        .get('/api/users')
        .then((response) => {
          return response.data.data;
        })
        .catch((error) => {
          console.log(error);
          return []
        });
    },
    addUser(user) {
      this.users.push(user)
    },
    modalUpdateUser(userId) {
      var user = this.users.filter(user => user.id == userId)[0];
      this.user = user;
      this.action = 'update';
      this.modal = true;
    },
    updateUser(user) {
      console.log("ICI", user);
      // this.users = this.users.filter(user => user.id != userId)
    },
    removeUser(userId) {
      this.users = this.users.filter(user => user.id != userId)
    }
  }
};
</script>

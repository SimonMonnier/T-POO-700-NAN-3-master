<template>
  <div class="modal-user card flex centered">
    <div class="backdrop"></div>
    <form v-if="action == 'add'" @submit.prevent="saveUser" class="flex column centered">
      Ajouter un utilisateur
      <input placeholder="nom" type="text" name="username" id="username" v-model="username">
      <input placeholder="email@gmail.com" type="email" name="email" id="email" v-model="email">
      <input type="submit" value="Enregistrer">
      <button @click.stop="this.$emit('close')">Fermer</button>
    </form>
    <form v-if="action == 'update'" @submit.prevent="updateUser" class="flex column centered">
      Modifier un utilisateur
      <input placeholder="nom" type="text" name="username" id="username" v-model="username">
      <input placeholder="email@gmail.com" type="email" name="email" id="email" v-model="email">
      <input type="submit" value="Enregistrer">
      <button @click.stop="this.$emit('close')">Fermer</button>
    </form>
  </div>
</template>

<script>
export default {
  name: "ModalUser",
  props: {
    action: String,
    user: Array,
  },
  data() {
    return {
      username: "",
      email: "",
      id: null,
    }
  },
  mounted() {
    if (this.action == 'update') {
      this.id = this.user.id;
      this.username = this.user.username;
      this.email = this.user.email
    }
  },
  methods: {
    async saveUser() {
      var user = await this.$axiosConfigInstance
        .post('/api/users', {
          "user": {
            "username": this.username,
            "email": this.email,
          }
        })
        .then((response) => {
          return response.data;
        })
        .catch((error) => {
          console.log(error);
        });
      this.$emit('add', user);
      this.$emit('close');
    },
    async updateUser() {
      var user = await this.$axiosConfigInstance
        .put(`/api/users/${this.id}`, {
          "user": {
            "username": this.username,
            "email": this.email,
          }
        })
        .then((response) => {
          return response.data;
        })
        .catch((error) => {
          console.log(error);
        });
      this.$emit('update', user);
      // this.$emit('close');
    },
  },
}
</script>
<style lang="scss" scoped>
.modal-user {
  position: absolute;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  z-index: 2;
  background-color: transparent;
  .backdrop {
    width: 100%;
    height: 100%;
    background-color: rgba($color: #000000, $alpha: .5);
    position: absolute;
  }
  form {
    width: 50%;
    height: 50%;
    z-index: 3;
    background-color: rgb(228, 189, 189);
  }
}
</style>
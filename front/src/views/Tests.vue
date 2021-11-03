<template>
  <div class="tests flex column centered">
    <div class="card"><h1>Page pour réaliser des tests avec les components</h1></div>
    <div class="content card flex column centered">
      <!-- Insérer les components ici -->
    </div>
  </div>
</template>

<script>
export default {
  name: 'Tests',
  data() {
    return {
      test: '',
    };
  },
  components: {},
  methods: {},
  mounted() {},
};
</script>

<style lang="scss" scoped>
.tests {
  gap: 25px;
  h1 {
    margin: 10px;
  }
  .content {
    width: 100%;
    height: 500px;
  }
}
</style>

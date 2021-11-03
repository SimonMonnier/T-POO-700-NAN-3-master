<template>
  <div class="hours row">
    <div class="row">
      <p>Heure de début : <strong>09h30</strong></p>
      <hr />
      <p>Heure de fin : <strong>13h00</strong></p>
    </div>
    <div class="row">
      <button class="circle-btn"><IconEdit /></button>
      <button class="circle-btn"><IconDelete /></button>
    </div>
  </div>
</template>

<script>
import IconDelete from './svg/IconDelete.vue'
import IconEdit from './svg/IconEdit.vue'
export default {
  name: "TheWorkingTimes.vue",
  components: {
    IconEdit,
    IconDelete

  }
}
</script>
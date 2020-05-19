<template>
  <div class="main-container">
    <div class="container footer-inner">
      <p>&copy; Менглиев Азамат</p>
      <p>ВШИТИС 11-603 2020</p>
    </div>
  </div>
</template>

<script>
  export default {
    name: "footer"
  }
</script>

<style scoped lang="scss">
.footer-inner {
  background: var(--lightgrey);
  display: flex;
  justify-content: space-between;
  align-items: center;

  p {
    font-weight: 300;
  }
}
</style>

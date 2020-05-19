<template>
  <div class="container">
    <div class="image">
      <div class="image-content">
        <div class="image-content-text">
          <h1>UMPIRE</h1>
          <h3>Одна платформа - миллион возможностей</h3>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'home'
}
</script>

<style scoped lang="scss">
.container {
  background: white;
  padding: 0;
}

.image {
  background: url("../assets/img/home-cover.jpeg");
  background-size: cover;
  width: 100%;
  height: 20rem;
  position: relative;

  &-content {
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.75);
    display: flex;
    justify-content: center;
    align-items: center;

    &-text {
      text-align: center;
      color: white;
      margin-top: 4rem;

      h1 {
        font-size: 7rem;
      }

      h3 {
        font-size: 2rem;
        -webkit-text-stroke: 1px black;
      }
    }
  }
}
</style>

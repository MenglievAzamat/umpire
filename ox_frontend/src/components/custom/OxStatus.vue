<template>
    <div :style="`background:${color};`" @click="$emit('click', $event)">
        <b>{{ stat }}</b>
    </div>
</template>

<script>
  export default {
    name: "ox-status",
    props: ['status'],
    data() {
      return {
        status_word: [
            "Ожидает подтверждения",
            "Подтверждён",
            "Отправлен",
            "Получен",
            "Возврат",
            "Закрыт"
        ]
      }
    },
    computed: {
      stat() {
        return this.status_word[this.status];
      },
      color() {
        switch (this.status) {
          case 0:
          case 2:
            return "orange";
          case 1:
          case 3:
            return "var(--success)";
          case 4:
            return "var(--danger)";
          case 5:
            return "var(--black)";
        }
      }
    }
  }
</script>

<style scoped lang="scss">
    div {
        border: none !important;
        width: 100% !important;
        color: white !important;
        cursor: pointer;
        transition: 0.2s ease-in-out;

        &:hover {
            transform: scale(1.05);
        }
    }
</style>

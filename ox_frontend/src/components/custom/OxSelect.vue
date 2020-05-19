<template>
    <select @change="updateSelect($event.target.value)">
        <option disabled selected>{{ label }}</option>
        <option v-for="item in items" :value="item.value">{{ item.text }}</option>
    </select>
</template>

<script>
  export default {
    name: "ox-select",
    props: {
      items: {
        type: Array,
        required: true
      },
      label: String
    },
    methods: {
      updateSelect(value) {
        this.$emit('input', value);
      }
    }
  }
</script>

<style scoped lang="scss">
    select {
        width: 100%;
        margin-top: 1rem;
        transition: 0.25s;

        border: 1px solid lightgray;
        height: 2.5rem;
        border-radius: 5px;
        padding: 0 1rem;
        font-size: 1.1rem;

        &:focus {
            border-color: var(--black);
            transform: scale(1.025);
        }
    }
</style>

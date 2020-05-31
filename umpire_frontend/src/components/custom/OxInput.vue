<template>
    <div class="input">
        <label v-if="label" :for="label">{{ label }}</label>
        <input
            :id="label"
            :type="type"
            :max="max"
            :required="required"
            :class="{'no-margin' : !label}"
            v-model="value"
            @input="updateValue"
            @focusout="checkIfRequired"
            @keypress.enter="$emit('keypress', $event.target)"
        >
        <p class="errors">{{ errors }}</p>
    </div>
</template>

<script>
  export default {
    name: "ox-input",
    props: {
      type: String,

      label: {
        type: String
      },

      required: Boolean,

      max: {
        type: Number
      }
    },
    data() {
      return {
        errors: "",
        value: ""
      }
    },
    methods: {
      updateValue() {
        if (this.max < parseInt(this.value)) {
          this.value = this.max;
          this.errors = "Значение не может быть выше " + this.max;
        }

        this.$emit('input', this.type === "number" ? parseInt(this.value) : this.value);
      },

      checkIfRequired() {
        if (this.required) {
          if (this.$attrs.value.length === 0) {
            this.errors = "Поле не должно быть пустым";
          } else if (this.type === "email" && !this.$attrs.value.match(/.+@.+\..+/)) {
            this.errors = "Пример почты: example@mail.ru"
          } else {
            this.errors = "";
          }
        } else {
          this.errors = "";
        }
      }
    }

  }
</script>

<style scoped lang="scss">
    .input {
        label {
            font-size: 1.5rem;
        }

        input {
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

        .errors {
            color: var(--danger);
            margin-top: 0.5rem;
        }
    }
</style>

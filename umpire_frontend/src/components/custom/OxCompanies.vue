<template>
    <div>
        <h1>{{ label }}</h1>

        <div class="companies">
            <div
                class="company"
                v-for="company in companies"
                :key="company.id"
                @click="role ? browseCompany(role, company.id) : ''"
            >
                <h2><i>"{{ company.name }}"</i></h2>
                <h3 v-if="company.quantity">Количество: <span>{{ company.quantity }}</span></h3>
                <h3 v-if="company.scope">Сфера деятельности: <span>{{ company.scope }}</span></h3>
            </div>
        </div>
    </div>
</template>

<script>
  export default {
    name: "ox-companies",
    props: ["companies", "role", "label"],
    methods: {
      browseCompany(role, company_id) {
        this.$router.push(`/company/${role}/${company_id}`);
      }
    }
  }
</script>

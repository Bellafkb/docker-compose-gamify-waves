<template>
  <ApplicationsHandler
    style="margin-top:40px"
    :accept_application="ACCEPT_APPLICATION"
    :reject_application="REJECT_APPLICATION"
    :applications="getApplications"
  />
</template>

<script>
import ApplicationsHandler from "../components/ApplicationsHandler.vue";
import { mapGetters, mapActions } from "vuex";
export default {
  name: "ApplicationHandlerView",
  components: {
    ApplicationsHandler
  },
  mounted() {
    this.GET_APPLICATIONS(this.$route.params.id);
  },
  computed: {
    ...mapGetters(["getApplications"])
  },
  methods: {
    ...mapActions([
      "REJECT_APPLICATION",
      "ACCEPT_APPLICATION",
      "GET_APPLICATIONS"
    ])
  }
};
</script>

<style></style>

<template>
  <PoolEventForm/>
</template>

<script>
import PoolEventForm from "../components/PoolEventForm";
import {mapGetters} from "vuex";

export default {
  name: "PoolEventFormView",
  components: {
    PoolEventForm: PoolEventForm
  },
  computed:{
    ...mapGetters(["getUser"])
  },
  mounted(){
    if(!this.getUser){
      window.location.href = '/waves';
    }
  }
};
</script>

<style>
</style>

<template>
  <div>
    <el-col v-for="poolevent in favorites" :key="poolevent.id" :span="24">
      <PooleventCard style="width:95%;margin:auto;margin-top:5px" :poolEvent="poolevent" />
    </el-col>
  </div>
</template>

<script>
import PooleventCard from "./PoolEventCard";
import { mapGetters} from "vuex";

export default {
  name: "MyFavoritePoolevents",
  components: {
    PooleventCard
  },
  computed:{
    ...mapGetters(["favorites"])
  },
  mounted() {
    
  }
};
</script>

<style>
</style>
<template>
  <div>
    <el-col
      v-for="poolevent in getAllPoolEvents"
      :key="poolevent.id"
      :span="24"
    >
      <PooleventCard
        style="width:95%;margin:auto;margin-top:5px"
        :poolEvent="poolevent"
      />
    </el-col>
  </div>
</template>
<script>
import PooleventCard from "./PoolEventCard";
import { mapGetters } from "vuex";

export default {
  name: "MyPoolevents",
  components: { PooleventCard },
  data() {
    return {
      mypoolevents: []
    };
  },
  computed: {
    ...mapGetters(["getAllPoolEvents"])
  }
};
</script>

<style lang="less" scoped>
.row-text-application {
  border-radius: 2%;
  background: #eee;
  padding: 10px;
}

.event-start-end {
  list-style: none;
  margin: 0;
  padding: 0;
  li {
    float: left;
    padding: 5px;
  }
}
</style>

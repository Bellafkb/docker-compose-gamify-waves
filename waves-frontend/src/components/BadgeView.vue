<template>
  <el-container>
    <el-row>
      <p style="margin-left:40px">
        learn more about Achievements <a href="/waves/wiki/badges">here</a>
      </p>
      <el-col
        :span="24"
        :v-if="achievementProgress.length > 0"
        v-for="p in achievementProgress"
        :key="p.idbadge"
      >
        <Achievement :achievement="p"/>
      </el-col>
    </el-row>
  </el-container>
</template>

<script>
import Achievement from "./Achievement";
import { mapGetters } from 'vuex';
export default {
  name: "BadgeView",
  components: {
    Achievement
  },
  data() {
    return {
      progress: []
    };
  },
  computed:{
    ...mapGetters(["achievementProgress"])
  },
};
</script>

<style>
.el-container {
  width: 100%;
  margin: auto;
}
</style>

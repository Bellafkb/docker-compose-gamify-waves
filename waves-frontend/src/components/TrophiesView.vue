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
import axios from "axios"
export default {
  name: "BadgeView",
  components: {

  },
  data() {
    return {
      progress: []
    };
  },
  computed:{
  },
};
</script>

<style>
.el-container {
  width: 100%;
  margin: auto;
}
</style>

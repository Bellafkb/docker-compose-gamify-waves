<template>
  <el-card style="margin:auto;width:95%">
    <el-col :span="3">
      <img
        :style="
          true == 0
            ? 'width:80px;opacity:0.1;'
            : 'opacity:1;filter;alpha(opacity=50);width:80px'
        "
        :src="achievementProgress.img_url"
        class="badge-img"
        disable
      />
    </el-col>
    <el-col :offset="2" :span="19">
      <el-row>
        <span>{{ achievementProgress.name }}</span>
        <span style="float:right;color:grey">
          unlocked by 15% of supporter
        </span>
      </el-row>
      <el-row v-for="(challenge, i) in achievement.progress"  :key="i">
        <Challenge :challenge="challenge[0]" :desc="achievementProgress.desc"/>
      </el-row>
    </el-col>
  </el-card>
</template>

<script>
import Challenge from "../components/Challenge"
export default {
  name: "Achievement",
  components:{
    Challenge
  },
  props: ["achievement"],
  data() {
    return { avg: "", achievementProgress: "" };
  },
  mounted() {
    this.achievementProgress = this.achievement;
  }
};
</script>

<style>
.el-row {
  width: 100%;
}

.el-card {
  width: 100%;
  padding: 0;
}

.el-col {
  padding: 0px;
}

.badge-img {
  margin: 5px;
  border-radius: 50%;
  margin-bottom: 20px;
}

.badge-info-list {
  list-style-type: none;
}

.badge-info-list li {
  margin: 10px;
}
</style>

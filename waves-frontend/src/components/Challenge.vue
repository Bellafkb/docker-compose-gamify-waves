<template>
  <el-row style="margin-top:20px">
    <span>{{desc}}</span>
    <el-progress
      :percentage="(score / points) * 100"
      :status="(score / points) * 100===100?'success':'format'"
    />
  </el-row>
</template>

<script>
export default {
  name: "Challenge",
  data() {
    return {
      score: 0,
      points: 0,
      type: "",
      completed: "",
      item: "",
      desc: ""
    };
  },
  props: ["challenge", "desc"],
  mounted() {
    console.log("-->" ,this.desc);
    this.item = this.challenge;
    const { score, points, type, completed} = this.item;
    this.score = score;
    this.points = points;
    this.type = type;
    this.completed = completed;
    this.desc= this.desc
  }
};
</script>

<style></style>

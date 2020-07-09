<template>
  <div>
      <h3>Onboarding Badges</h3>
    <el-row :gutter="20" style="margin-top:20px" v-for="badge in badges" :key="badge.id">
      <el-col :xs="5" :lg="2">
        <img :src="badge.img_url" alt=""  style="width:60px;border-radius:50%"/>
      </el-col>
      <el-col justify="center" :xs="6" :lg="5" >
        <span>{{badge.name}}</span>
      </el-col>
      <el-col :xs="13" :lg="5" ><span>{{badge.desc}}</span></el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "NormaleBadges",
  props: ["badges"],
  data() {
    return {
      config: ""
    };
  }
};
</script>

<style>

</style>
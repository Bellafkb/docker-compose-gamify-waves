<template>
  <el-card style="width:100%" :body-style="{ paddingTop: '10px' }">
    <div slot="header">
      <el-row>
        <el-col :span="getRoles == 'admin' && isLogedIn ? 14 : 17">
          <a
            :href="`/waves/event/${poolEvent.idevent}`"
            style="text-decoration:none;color:black"
          >
            <span></span>
          </a>
        </el-col>
  </el-card>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "Trophies",
  data() {
    return {
      
    };
  }
}
</script>

<style>
</style>
<template>
  <div class="sh-container" style="margin:auto;text-align:center;">
    <el-button style="width:40px;margin:0;border:0" @click="dialogFormVisible = true" circle>
      <i class="el-icon-share"></i>
    </el-button>

    <el-dialog
      :width="innerWidth>=765?'30%':'90%'"
      title="Share"
      :visible.sync="dialogFormVisible"
    >
      <div style="margin:auto">
        <el-row>
          <el-col :span="6">
            <facebook :url="location" scale="3"></facebook>
          </el-col>
          <el-col :span="6">
            <twitter :url="location" scale="3"></twitter>
          </el-col>
          <el-col :span="6">
            <linkedin :url="location" scale="3"></linkedin>
          </el-col>
          <el-col :span="6">
            <telegram :url="location" scale="3"></telegram>
          </el-col>
        </el-row>
        <el-row style="margin-top:20px">
          <el-col :span="6">
            <whats-app :url="location" title="Hello" scale="3"></whats-app>
          </el-col>
          <el-col :span="6">
            <pinterest :url="location" scale="3"></pinterest>
          </el-col>
          <el-col :span="6">
            <reddit :url="location" scale="3" title="Supporter needed at vca"></reddit>
          </el-col>
          <el-col :span="6">
            <email :url="location" subject="Hello" scale="3"></email>
          </el-col>
        </el-row>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  Facebook,
  Twitter,
  Linkedin,
  Pinterest,
  Reddit,
  Telegram,
  WhatsApp,
  Email
} from "vue-socialmedia-share";
export default {
  name: "SharingButton",
  components: {
    Facebook,
    Twitter,
    Linkedin,
    Pinterest,
    Reddit,
    Telegram,
    WhatsApp,
    Email
  },
  data() {
    return {
      dialogFormVisible: false,
      innerWidth: ""
    };
  },
  props: ["location"],
  mounted() {
    this.innerWidth = window.innerWidth;
  }
};
</script>

<style>
.sh-container {
  margin: auto;
  width: 100%;
}
@media screen and (min-width: 765px) {
  .sh-container {
    width: 10%;
  }
}
</style>
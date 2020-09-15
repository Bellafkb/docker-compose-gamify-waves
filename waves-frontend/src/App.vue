<template>
  <div id="app">
    <Navbar :logout="logout"></Navbar>
    <el-row style="width:90%;margin:auto;margin-top:40px;">
      <el-col :span="15">
        <router-view />
      </el-col>
      <el-col style="margin-top:45px" :offset="1" :span="7">
        <CrewLeaderboard />
      </el-col>
    </el-row>
  </div>
</template>
<script>
import Vue from "vue";
import Navbar from "./components/Navbar";
import CrewLeaderboard from "./components/CrewLeaderboard";
import vueCookies from "vue-cookies";
import { mapGetters, mapActions, mapMutations } from "vuex";
import "froala-editor/js/plugins.pkgd.min.js";
import "froala-editor/js/third_party/embedly.min";
import "froala-editor/js/third_party/font_awesome.min";
import "froala-editor/js/third_party/spell_checker.min";
import "froala-editor/js/third_party/image_tui.min";
import "froala-editor/css/froala_editor.pkgd.min.css";
import VueFroala from "vue-froala-wysiwyg";
import io from "socket.io-client"
Vue.use(VueFroala);
Vue.config.productionTip = false;

Vue.use(vueCookies);

export default {
  name: "app",
  components: {
    Navbar,
    CrewLeaderboard
  },
  data() {
    return {
      isDev: process.env.ENV === "dev",
      //socket: io(process.env.VUE_APP_GAMIFY_BACKEND_DEV)
    };
  },
  computed: {
    ...mapGetters([
      "getErrors",
      "getSuccessMessage",
      "isLogedIn",
    ])
  },
  updated() {
    if (this.getErrors.length > 0) {
      this.$notify.error({
        title: `Error: ${this.getErrors[this.getErrors.length - 1]}`,
        type: "danger"
      });
      this.resetErrors();
    }
  },
  created() {
    if (this.socket) {
      this.socket.on("NEW_POOLEVENT", pooleventId => {
        this.$notify({
          title: `Event with id: ${pooleventId} was added`,
          message: "click ",
          type: "success"
        });
      });
      this.socket.on("NEW_BADGE", data => {
        this.$notify({
          title: `New badge unlocked: ${data.name}`,
          dangerouslyUseHTMLString: true,
          message: `
        <div>
          <el-row>
            <el-col :span="6">
              <img style="border-radius:50%" src="${data.img_url}" alt=""/>
            </el-col>
          </el-row>
        </div>
        `,
          type: "success",
          duration: 1000
        });
      });
    }
  },
  methods: {
    ...mapMutations(["setUser","setAppState", "logout","setAccessToken"]),
    ...mapActions({
      logedIn: "IS_LOGED_IN",
      resetErrors: "RESET_ERRORS"
    })
  },
  mounted() {
    const waves_access_token = this.$cookies.get("waves_access_token");
    if (waves_access_token) {
      this.setUser(waves_access_token);
      this.setAppState()
      this.setAccessToken(waves_access_token)
    }
  }
};
</script>

<style lang="less">
@import "assets/less/form";
#app {
  flex: 1;
  display: flex;
  flex-direction: column;
  margin: 0%;
}
#content {
  flex-grow: 1;
  display: flex;
  overflow: auto;
}
body {
  margin: 0;
  font-family: "lucida grande", tahoma, verdana, arial, sans-serif;
  font-size: 14px;
  background-color: #e9ebee;
}
</style>

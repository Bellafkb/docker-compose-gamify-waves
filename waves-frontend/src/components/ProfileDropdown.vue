<template>
  <el-dropdown trigger="click">
    <span class="el-dropdown-link">
      <el-button style="width:30px;height:30px;padding:0;border:0" circle>
        <el-badge type="danger">
          <img
            style="float:right;width:30px;height:30px"
            :src="
              getUser
                ? `https://eu.ui-avatars.com/api/?rounded=true&name=${getUser.firstName}+${getUser.lastName}`
                : 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'
            "
            alt="profile-img"
          />
        </el-badge>
      </el-button>
    </span>
    <el-dropdown-menu style="padding:0;width:110px" slot="dropdown">
      <ul style="list-style:none;padding:0px;margin:0px;">
        <a
          v-if="this.$cookies.get('waves_access_token')"
          style="text-decoration: none;"
          href="/waves/profile"
        >
          <li class="profile-item"><i class="el-icon-user"></i> my profile</li>
        </a>
        <a
          style="text-decoration: none;"
          v-if="getUser.secondRole == 'admin' && this.$cookies.get('waves_access_token')"
          href="/waves/dashboard"
        >
          <li class="profile-item">
            <i class="el-icon-setting"></i> dashboard
          </li>
        </a>
        <a
          v-if="this.$cookies.get('waves_access_token')"
          style="text-decoration: none;"
          href="/waves"
          @click="logout"
        >
          <li class="profile-item">logout</li>
        </a>
        <a
          v-if="!this.$cookies.get('waves_access_token')"
          style="text-decoration: none;"
          :href="
            `${
              isDev ? authUrlDev : authUrlProduction
            }/drops/oauth2/code/get?client_id=${
              isDev ? clientIdDev : clientIdProduction
            }&response_type=code&state=${
              isDev
                ? `${frontendDev}${this.$router.history.current.path}`
                : `${frontendProduction}${this.$router.history.current.path}`
            }&redirect_uri=${isDev ? redirectDev : redirectProduction}`
          "
        >
          <li class="profile-item">login</li>
        </a>
      </ul>
    </el-dropdown-menu>
  </el-dropdown>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "ProfileDropDown",
  props: ["logout"],
  computed: {
    ...mapGetters(["getUser"])
  },
  data() {
    return {
      isDev: process.env.VUE_APP_ENV_MODE === "dev",
      authUrlDev: process.env.VUE_APP_OAUTH_DEV,
      authUrlProduction: process.env.VUE_APP_OAUTH_PRODUCTION,
      clientIdDev: process.env.VUE_APP_CLIENT_ID_DEV,
      clientIdProduction: process.env.VUE_APP_CLIENT_ID_PRODUCTION,
      redirectDev: process.env.VUE_APP_REDIRECT_DEV,
      redirectProduction: process.env.VUE_APP_REDIRECT_PRODUCTION,
      frontendDev: process.env.VUE_APP_FRONTEND_DEV,
      frontendProduction: process.env.VUE_APP_FRONTEND_PRODUCTION
    };
  },
  mounted(){
    console.log("-->",clientIdDev); 
  }
};
</script>

<style>
.profile-item:hover {
  background-color: #eee;
  padding: 5px 5px 10px 10px;
  color: black;
}

.profile-item {
  padding: 5px 5px 10px 10px;
  color: black;
}
</style>

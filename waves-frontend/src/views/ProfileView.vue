<template>
  <div class="p-container">
    <el-row style="margin:auto;padding:3%">
      <el-col :span="6">
        <img
          style="border-radius: 50%;margin:auto;"
          class="profile-img"
          :src="
            `https://eu.ui-avatars.com/api/?rounded=true&name=${getUser.firstName}+${getUser.lastName}`
          "
        />
      </el-col>
      <el-col style="margin-top:8px" :span="14">
        <el-row>
          <strong style="font-size:20px">{{ getUser.fullName }}</strong>
        </el-row>
        <el-row>
          <span style="color:gray">Supporter since 200 days</span>
        </el-row>
      </el-col>
    </el-row>
    <el-row>
      <el-tabs v-model="activeName" style="margin:auto;">
        <el-tab-pane label="Achievements" name="achievements">
          <BadgeView />
        </el-tab-pane>
        <el-tab-pane label="Poolevents" name="poolevents">
          <MyPoolevents />
        </el-tab-pane>
        <el-tab-pane label="Favorites" name="favorites">
          <MyFavoritePoolevents />
        </el-tab-pane>

        <el-tab-pane label="Applications" name="applications">
          <MyApplications />
        </el-tab-pane>
      </el-tabs>
    </el-row>
  </div>
</template>

<script>
import BadgeView from "../components/BadgeView";
import MyFavoritePoolevents from "../components/MyFavoritePoolevents";
import MyApplications from "../components/MyApplications";
import MyPoolevents from "../components/MyPoolEvents";
import { mapGetters, mapActions } from "vuex";
export default {
  name: "ProfileView",
  components: {
    BadgeView,
    MyFavoritePoolevents,
    MyApplications,
    MyPoolevents
  },
  data() {
    return {
      activeName: "poolevents"
    };
  },
  async mounted() {
    this.FETCH_MY_POOLEVENTS();
    this.FETCH_MY_FAVORITES();
    this.FETCH_MY_APPLICATIONS();
    this.FETCH_MY_ACHIEVEMENT_PROGRESS();
  },
  computed: {
    ...mapGetters(["getUser", "getAllPoolEvents", "favorites"])
  },
  methods: {
    ...mapActions([
      "FETCH_MY_POOLEVENTS",
      "FETCH_MY_FAVORITES",
      "FETCH_MY_APPLICATIONS",
      "FETCH_MY_ACHIEVEMENT_PROGRESS"
    ])
  }
};
</script>

<style>
.p-container {
  margin: auto;
  width: 100%;
}
@media only screen and (min-width: 768px) {
  .p-container {
    margin: auto;
    width: 100%;
  }
}
</style>

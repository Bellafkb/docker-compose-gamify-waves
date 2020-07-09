<template>
  <el-dropdown trigger="click">
    <span class="el-dropdown-link">
      <el-button
      size="small"
        class="bell-button"
        style="padding:0;border:0;background:#0a6b91;"
        @click="fetchNotification"
        circle
      >
        <el-badge
          :value="notifications.length"
          type="danger"
          :hidden="notifications.length==0|| setSeen"
        >
          <img
            style="height:20px"
            src="https://img.icons8.com/officel/30/000000/appointment-reminders.png"
            alt="scoop"
          />
        </el-badge>
      </el-button>
    </span>
    <el-dropdown-menu class="noti-dialog" style="padding:0;" slot="dropdown">
      <el-row>
        <el-col style="padding:5px;" :span="24">Notifications</el-col>
      </el-row>
      <el-row>
        <el-col v-if="allNotification" :span="24">
          <a
            v-for="noti in allNotification"
            :key="noti.notification.id"
            :href="`/waves/poolevent/${noti.notification.source_id}`"
          >
            <el-card style="padding-top:0px;padding-bottom:15px" shadow="never">
              <el-col :span="2">
                <i :class="noti.notification.type=='poolevents'?'el-icon-date':'el-icon-medal-1'"></i>
              </el-col>
              <el-col :span="18">
                <span>{{formatNotification(noti)}}</span>
              </el-col>
              <el-col :span="4">
                <time-ago
                  style="float:right;color:grey;text-decoration:none;"
                  class="title"
                  :datetime="noti.notification.created_at"
                  refresh
                  locale="en"
                  :long="false"
                ></time-ago>
              </el-col>
            </el-card>
          </a>
        </el-col>
      </el-row>
      <el-row>
        <el-col style="padding:5px;margin-left:43%;" :span="24">
          <a href="/waves/notifications">see all</a>
        </el-col>
      </el-row>
    </el-dropdown-menu>
  </el-dropdown>
</template>

<script>
import Axios from "axios";
import TimeAgo from "vue2-timeago";

export default {
  name: "NotificationBell",
  components: {
    TimeAgo
  },
  data() {
    return {
      notifications: [],
      allNotification: [],
      setSeen: false,
      config: ""
    };
  },
  async mounted() {
    this.config = {
      headers: { Authorization: `Bearer ${this.$cookies.get("access_token")}` }
    };
    const { data } = await Axios.get(
      "/waves/api/v1/notification/user/1/new",
      this.config
    );
    this.notifications = data.data;
  },
  methods: {
    formatNotification({ notification, source }) {
      switch (notification.type) {
        case "poolevents":
          return `john doe added a poolevent ${source.name || "blank"}`;
        case "badges":
          return "new badge unlocked";
      }
    },
    async fetchNotification() {
      const { data } = await Axios.get(
        "/waves/api/v1/notification/user",
        this.config
      );
      this.allNotification = data.data;
      this.setSeen = true;
    }
  }
};
</script>

<style>
.bell-button:hover {
  background: #0a6b91;
}


.noti-dialog {
  width: 100%;
}

@media only screen and (min-width: 768px) {
  .noti-dialog {
    width: 30%;
  }
}
</style>
<template>
  <el-card style="width:100%" :body-style="{ paddingTop: '10px' }">
    <div slot="header">
      <el-row>
        <el-col :span="getRoles == 'admin' && isLogedIn ? 14 : 17">
          <a
            :href="`/waves/event/${poolEvent.idevent}`"
            style="text-decoration:none;color:black"
          >
            <span>{{ poolEvent.name }}</span>
          </a>
        </el-col>

        <el-col v-if="poolEvent.type_name" :span="7">
          <span style="color:grey;float:right">{{ poolEvent.type_name }}</span>
        </el-col>
        <el-col
          v-if="getRoles == 'admin' && isLogedIn && poolEvent.state"
          :span="3"
        >
          <el-tag
            :type="
              poolEvent.state == 'RELEASED'
                ? 'success'
                : poolEvent.state == 'UNRELEASED'
                ? 'primary'
                : 'danger'
            "
            size="mini"
            >{{ poolEvent.state }}</el-tag
          >
        </el-col>
      </el-row>
    </div>
    <el-row style="margin-top: 10px;">
      <el-col :xs="2" :lg="1">
        <i class="el-icon-location-outline"></i>
      </el-col>
      <el-col :span="22">{{
        `${poolEvent.route} ${poolEvent.street_number}, ${poolEvent.postal_code} ${poolEvent.locality}`
      }}</el-col>
    </el-row>
    <el-row style="margin-top: 10px;">
      <el-col :xs="2" :lg="1">
        <i class="el-icon-time"></i>
      </el-col>
      <el-col :span="22"
        >{{
          `${new Date(poolEvent.event_start).getUTCHours()}:${new Date(
            poolEvent.event_start
          ).getUTCMinutes()}h`
        }}
        -
        {{
          `${new Date(poolEvent.event_end).getUTCHours()}:${new Date(
            poolEvent.event_end
          ).getUTCMinutes()}h`
        }}</el-col
      >
    </el-row>
    <el-row style="margin-top: 10px;">
      <el-col :xs="2" :lg="1">
        <i class="el-icon-date"></i>
      </el-col>
      <el-col :span="22">
        {{ new Date(poolEvent.event_start).getDate() }}.
        {{
          new Date(poolEvent.event_start).toLocaleString("default", {
            month: "short"
          })
        }}
        {{ new Date(poolEvent.event_start).getFullYear() }}
      </el-col>
    </el-row>
    <el-row v-if="isLogedIn" style="margin-top: 15px;">
      <el-col style="text-align:center" :span="getRoles != 'admin' ? 8 : 6">
        <el-button
          v-if="getRoles == 'admin'"
          style="margin-top:5px;
                width:40px;
                height:40px;
                margin:auto;
                border:0
                text-align:center"
          @click="
            () => this.$router.push(`/waves/applications/${poolEvent.id}`)
          "
          circle
        >
          <i class="el-icon-circle"></i> applications
        </el-button>
      </el-col>
      <el-col style="text-align:center" :span="getRoles != 'admin' ? 8 : 6">
        <ApplicationButton
          :poolevent_id="poolEvent.id"
          style="width:40px;margin:0;border:0;text-align:center;margin:auto"
        />
      </el-col>
      <el-col style="text-align:center" :span="getRoles != 'admin' ? 8 : 6">
        <SharingButton
          :location="`https://localhost${this.$router.history.current.path}`"
          style="width:40px;margin:0;border:0;text-align:center;margin:auto"
        />
      </el-col>
      <el-col style="text-align:center" :span="getRoles != 'admin' ? 8 : 6">
        <FavoriteButton :poolevent_id="poolEvent.id" />
      </el-col>
    </el-row>
  </el-card>
</template>

<script>
import SharingButton from "./SharingButton";
import FavoriteButton from "./FavoriteButton";
import ApplicationButton from "./ApplicationButton";
import { mapGetters } from "vuex";

export default {
  name: "PoolEventCard",
  components: {
    ApplicationButton,
    SharingButton,
    FavoriteButton
  },
  props: ["poolEvent"],
  data() {
    return {
      application: {
        user_id: 1,
        text: ""
      },
      startDate: "",
      endDate: "",
      startTime: "",
      endTime: ""
    };
  },
  methods: {
    submitForm() {
      this.$store.dispatch("APPLY", {
        application: this.application,
        poolEventId: this.poolEvent.id
      });
    }
  },
  computed: {
    ...mapGetters(["getRoles", "isLogedIn"]),
    url() {
      return "/poolevent/" + this.poolEvent.id;
    },
    address() {
      return (
        this.poolEvent.address.route +
        " " +
        this.poolEvent.address.street_number +
        "," +
        this.poolEvent.address.postal_code +
        " " +
        this.poolEvent.address.locality
      );
    },
    getStartTime() {
      let date = new Date(this.poolEvent.start);
      return date.toLocaleTimeString();
    },
    getStartDate() {
      let date = new Date(this.poolEvent.start);
      return date.toDateString();
    }
  }
};
</script>

<style>
.card-event {
  border-radius: 2%;
}
</style>

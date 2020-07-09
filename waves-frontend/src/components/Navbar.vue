 <template>
  <el-menu background-color="#0a6b91" mode="horizontal">
    <el-menu-item padding:0 index="2-1">
      <a href="/waves">
        <img class="logo" src="https://pool2.vivaconagua.org/dispenser/images/drop_small.png" />
        <h3
          class="logo-text"
          style="float:left;
        margin-top:0px;
        color:white;
        margin-left:10px;"
        >Viva Con Agua</h3>
      </a>
    </el-menu-item>
    <el-menu-item  v-if="getUser.crewRoleName" style="padding:0 10px 0px 10px;float:right">
      <el-button size="mini" type="primary" @click="pushCreatePoolevent">
        <strong> <i style="color:white" class="el-icon-circle-plus-outline"></i> CREATE</strong>
      </el-button>
    </el-menu-item>
    <el-menu-item style="padding:0 10px 0px 10px;float:right">
      <ProfileDropdown :logout="logout"></ProfileDropdown>
    </el-menu-item>
    <el-menu-item v-if="getUser.firstName" style="padding:0 10px 0px 10px;float:right">
      <NotificationBell v-if="this.$cookies.get('access_token')" style="margin-top:0px;float:right"></NotificationBell>
    </el-menu-item>
  </el-menu>
</template>

<script>
import NotificationBell from "./NotificationBell";
import ProfileDropdown from "./ProfileDropdown";
import { mapGetters } from "vuex";

export default {
  name: "Navbar",
  props: ["logout"],
  components: {
    NotificationBell,
    ProfileDropdown
  },
  methods: {
    pushCreatePoolevent() {
      this.$router.push("/waves/create");
    },
    isVolunteerManager() {
      return this.crew.role === "VolunteerManager";
    }
  },
  computed: {
    ...mapGetters(["getRoles", "getUser","isLogedIn"])
  }
};
</script>

<style>
.logo-text {
  display: none;
}

.logo {
  float: left;
  margin-top: 10px;
  margin-left: 10px;
  height: 35px;
}

.nav-container {
  margin-top: 1%;
}

@media only screen and (min-width: 768px) {
  .logo-text {
    display: block;
  }
  .logo {
    float: left;
    margin-top: 10px;
    margin-left: 10px;
    height: 35px;
  }
}
</style>

import Vuex from "vuex";
import Vue from "vue";
import mutations from "./mutations";
import actions from "./actions";
import getters from "./getters";

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    errors: [],
    poolEvents: [],
    poolEvent: "",
    applications: [],
    comments: [],
    isAdmin: true,
    isLogedIn: false,
    access_token: "",
    roles: "",
    months: [],
    statistic: "",
    recomandations: [],
    successMessage: [],
    crewRole: "",
    crewCity: "",
    leaderboard: [],
    eventtypes: [],
    supporters:[],
    appState:"LOGGEDOUT",
    APP_STATE : {
      ADMIN: "ADMIN",
      VOLUNTEER_MANAGER: "VOLUNTEERMANAGER",
      SUPPORTER: "SUPPORTER",
      LOGGEDOUT: "LOGGEDOUT"
    },
    achievements: [],
    favorites:[],
    actions:[],
    achievementProgress: []
  },
  getters,
  actions,
  mutations
});

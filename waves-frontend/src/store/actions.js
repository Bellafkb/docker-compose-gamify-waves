import axios from "axios";
import { pooleventActions } from "./poolevent";
import { commentActions } from "./comment";
import { applicationActions } from "./application";
import { voteActions } from "./vote";
import { authActions } from "./auth";
import { gamificationActions } from "./gamification";
import { supporterActions } from "./supporters";
import { filterActions } from "./filter";
import { favoriteActions } from "./favorite";

export const WAVES_BACKEND_URI =
  process.env.VUE_APP_ENV == "dev"
    ? process.env.VUE_APP_WAVES_BACKEND_DEV
    : process.env.VUE_APP_WAVES_BACKEND_DEV;

export default {
  ...pooleventActions,
  ...commentActions,
  ...applicationActions,
  ...voteActions,
  ...authActions,
  ...gamificationActions,
  ...supporterActions,
  ...filterActions,
  ...favoriteActions,
  FETCH_USER_STATISTIC: async ({ commit }, userId) => {
    const { data } = await axios.get(
      WAVES_BACKEND_URI + `/application/user/${userId}/statistic`
    );
    commit("setUserStatistic", data.statistic);
  },
  FETCH_RECOMANDATIONS: async ({ commit }) => {
    try {
      const { data } = await axios.get(WAVES_BACKEND_URI + `/favorite/most/me`);
      commit("setRecomandations", data.recomandations);
    } catch (error) {
      commit("pushError", error.message);
    }
  },

  RESET_ERRORS: ({ commit }) => {
    commit("resetErrors");
  },
  FETCH_EVENTTYPES: async ({ commit }) => {
    try {
      const { data } = await axios.get(WAVES_BACKEND_URI + `/eventtype`);
      console.log("FETCH_EVENTTYPES", data)
      commit("setEventTypes", data);
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  POST_EVENTTYPE: async ({ commit, getters }, type) => {
    try {
      await axios.post(
        WAVES_BACKEND_URI + `/eventtype`,
        getters.getAccessToken,
        type
      );
    } catch (error) {
      commit("pushError", error.message);
    }
  }
};

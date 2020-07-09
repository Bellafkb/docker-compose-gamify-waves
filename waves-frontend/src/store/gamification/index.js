import axios from "axios";

const GAMIFY_BACKEND_URI = process.env.VUE_APP_ENV_MODE
  ? process.env.VUE_APP_GAMIFY_BACKEND_DEV
  : process.env.VUE_APP_GAMIFY_BACKEND_PRODUCTION;



export const gamificationActions = {
  FETCH_LEADERBOARD: async ({ commit }) => {
    try {
      const { data } = await axios.get(GAMIFY_BACKEND_URI + `/leaderboard`);
      commit("setLeaderboard", data.leaderboard);
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  POST_ACHIEVEMENT: async ({ commit }, achievement) => {
    try {
      await axios.post(GAMIFY_BACKEND_URI + `/achievement`, achievement);
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  FETCH_ACHIEVEMENTS: async ({ commit }) => {
    try {
      const { data } = await axios.get(GAMIFY_BACKEND_URI + `/achievement`);
      commit("setAchievements");
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  FETCH_GAMIFY_ACTIONS: async ({ commit }) => {
    try {
      const { data } = await axios.get(GAMIFY_BACKEND_URI + `/action`);
      commit("setActions", data.actions);
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  FETCH_MY_ACHIEVEMENT_PROGRESS: async ({ commit }) => {
    try {
      const { data } = await axios.get(
        VUE_APP_GAMIFY_BACKEND_DEV + `/progress/${localStorage.getItem("userId")}`
      );
      commit("setMyAchievementProgress", data.achievements);
    } catch (error) {
      commit("pushError", error.message);
    }
  }
};

export const gamificationMutations = {
  setLeaderboard: (state, leaderboard) => {
    state.leaderboard = leaderboard;
  },
  setAchievements: (state, achievements) => {
    state.achievements = achievements;
  },
  setActions: (state, actions) => {
    state.actions = actions;
  },
  setMyAchievementProgress: (state, achievementProgress) => {
    state.achievementProgress = achievementProgress;
  }
};

export const gamificationGetters = {
  getLeaderboard: state => {
    return state.leaderboard;
  },
  getAchievements: state => {
    return state.achievements;
  },
  actions: state => {
    return state.actions;
  },
  achievementProgress: state => {
    return state.achievementProgress;
  }
};

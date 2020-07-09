import axios from "axios";

const WAVES_BACKEND_URI = process.env.VUE_APP_ENV_MODE
  ? process.env.VUE_APP_WAVES_BACKEND_DEV
  : process.env.VUE_APP_WAVES_BACKEND_PRODUCTION;

export const supporterActions = {
  FETCH_ALL_USERS: async ({ commit }) => {
    try {
      const { data } = await axios.get(WAVES_BACKEND_URI + `/user`);
      commit("setSupporters", data.data);
    } catch (error) {
      commit("pushError", error.message);
    }
  }
};

export const supporterMutations = {
  setSupporters: (state, supporters) => {
    state.supporters = supporters;
  }
};

export const supporterGetters = {
  supporters: state => {
    return state.supporters;
  }
};

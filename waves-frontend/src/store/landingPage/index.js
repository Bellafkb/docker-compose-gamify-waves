import axios from "axios";


const WAVES_BACKEND_URI = process.env.VUE_APP_ENV_MODE
  ? process.env.VUE_APP_WAVES_BACKEND_DEV
  : process.env.VUE_APP_WAVES_BACKEND_PRODUCTION;

export const commentActions = {
    FETCH_ALL_MONTHS: async ({ commit }) => {
        const { data } = await axios.get(WAVES_BACKEND_URI + "/months");
        commit("setMonths", data.months);
      },
};

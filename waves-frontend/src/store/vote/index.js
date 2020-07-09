import axios from "axios";

const WAVES_BACKEND_URI = process.env.VUE_APP_ENV_MODE
  ? process.env.VUE_APP_WAVES_BACKEND_DEV
  : process.env.VUE_APP_WAVES_BACKEND_PRODUCTION;

export const voteActions = {
  POST_VOTE: async ({ commit, getters }, vote) => {
    try {
      await axios.post(
        WAVES_BACKEND_URI + `/vote`,
        vote,
        getters.getAccessToken
      );
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  DELETE_VOTE: ({ commit, getters }, id) => {
    axios
      .delete(WAVES_BACKEND_URI + `/vote/${id}`, getters.getAccessToken)
      .then(resp => {})
      .catch(err => {
        commit("pushError", err.message);
      });
  }
};

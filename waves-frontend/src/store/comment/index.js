import axios from "axios";
const WAVES_BACKEND_URI = process.env.VUE_APP_ENV_MODE
  ? process.env.VUE_APP_WAVES_BACKEND_DEV
  : process.env.VUE_APP_WAVES_BACKEND_PRODUCTION;

const access_token = {
  headers: {
    authorization: "Bearer " + window.$cookies.get("waves_access_token")
  }
};

export const commentActions = {
  SUBMIT_COMMENT: async ({ commit }, comment) => {
    try {
      const { data } = await axios.post(
        WAVES_BACKEND_URI + `/comment`,
        comment.dat,
        access_token
      );
      commit("addComment", data.data);
      window.location = window.location.href
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  FETCH_COMMENTS: async ({ commit }, id) => {
    try {
      const { data } = await axios.get(
        WAVES_BACKEND_URI + `/comment/poolevent/${id}`
      );
      commit("setComments", data.data);
    } catch (error) {
      commit("pushError", error.message);
    }
  }
};

import axios from "axios";
import { WAVES_BACKEND_URI } from "../actions";

const access_token = {
  headers: {
    authorization: "Bearer " + window.$cookies.get("waves_access_token")
  }
};

export const applicationActions = {
  APPLY: async ({ commit, getters }, application) => {
    try {
      await axios.post(
        WAVES_BACKEND_URI + `/application`,
        application,
        access_token
      );
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  ACCEPT_APPLICATION: ({ commit, getters }, id) => {
    axios
      .put(
        WAVES_BACKEND_URI + "/application/" + id,
        { state: "ACCEPTED" },
        getters.getAccessToken
      )
      .then(resp => {
        commit("acceptApplication", resp.data);
      })
      .catch(err => {
        commit("pushError", err.message);
      });
  },
  REJECT_APPLICATION: ({ commit, getters }, id) => {
    axios
      .put(
        WAVES_BACKEND_URI + "/application/" + id,
        { state: "REJECTED" },
        access_token
      )
      .then(resp => {
        commit("acceptApplication", resp.data);
      })
      .catch(err => {
        commit("pushError", err.message);
      });
  },
  GET_APPLICATIONS: async ({ commit }, id) => {
    await axios
      .get(WAVES_BACKEND_URI + `/application/poolevent/${id}`, access_token)
      .then(({ data }) => {
        commit("setApplications", data.data);
      })
      .catch(err => {
        commit("pushError", err.message);
      });
  },
  FETCH_MY_APPLICATIONS: async ({ commit }) => {
    try {
      const { data } = await axios.get(WAVES_BACKEND_URI + "/application/user", access_token);
      commit("setApplications", data.data);
    } catch (error) {
      commit("pushError", error.message);
    }
  }
};

export const applicationGetters = {
  getApplications(state) {
    return state.applications;
  }
};

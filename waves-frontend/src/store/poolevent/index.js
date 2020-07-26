import axios from "axios";


const WAVES_BACKEND_URI = process.env.VUE_APP_ENV_MODE
  ? process.env.VUE_APP_WAVES_BACKEND_DEV
  : process.env.VUE_APP_WAVES_BACKEND_PRODUCTION;

const access_token = {
  headers: {
    authorization: "Bearer "+window.$cookies.get("waves_access_token")
  }
};

export const pooleventActions = {
  FETCH_POOLEVENTS_BY_FILTER: async ({ commit }, filter) => {
    try {
      const { data } = await axios.get(
        WAVES_BACKEND_URI + `/poolevent?${filter}`
      );
      commit("updatePoolEvents", data.data.poolevents);
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  GET_POOLEVENT_BY_ID: async ({ commit }, id) => {
    try {
      const { data } = await axios.get(
        `${WAVES_BACKEND_URI}/poolevent/${id}`
      );
      commit("setPoolEvent", data.data);
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  FETCH_MY_POOLEVENTS: async ({ commit }) => {
    try {
      const { data } = await axios.get(
        WAVES_BACKEND_URI + "/poolevent/user/me",
        access_token
      );
      commit("updatePoolEvents", data.data);
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  POST_POOLEVENT: async ({ commit }, poolevent) => {
    try {
      await axios.post(
        WAVES_BACKEND_URI + "/poolevent",
        poolevent,
        access_token
      );
      window.location = "/waves"
    } catch (error) {
      commit("pushError", error.response);
    }
  },
  DELETE_POOLEVENT: async ({ commit }, id) => {
    try {
      axios.delete(WAVES_BACKEND_URI + `/poolevent/${id}`);
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  PUT_POOLEVENT: async ({ commit, getters }, data) => {
    try {
      await axios.put(
        WAVES_BACKEND_URI + "/poolevent/" + data.id,
        data.poolevent,
        getters.getAccessToken
      );
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  SET_TO_RELEASED: async ({ commit, getters }, id) => {
    try {
      await axios.put(
        WAVES_BACKEND_URI + `/poolevent/${id}`,
        { front: { state: "RELEASED" } },
        getters.getAccessToken
      );
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  SET_TO_REFUSED: async ({ commit, getters }, id) => {
    try {
      await axios.put(
        WAVES_BACKEND_URI + `/poolevent/${id}`,
        { front: { state: "REJECTED" } },
        getters.getAccessToken
      );
    } catch (error) {
      commit("pushError", error.message);
    }
  },
  SET_TO_CANCELED: async ({ commit, getters }, id) => {
    try {
      await axios.put(
        WAVES_BACKEND_URI + `/poolevent/${id}`,
        { front: { state: "CANCELED" } },
        getters.getAccessToken
      );
    } catch (error) {
      commit("pushError", error.message);
    }
  }
};

export const pooleventGetters = {
  getAllPoolEvents(state) {
    return state.poolEvents;
  },
  getPoolEvent(state) {
    return state.poolEvent;
  }
};

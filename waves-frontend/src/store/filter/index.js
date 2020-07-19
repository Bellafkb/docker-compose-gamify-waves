import axios from "axios";

const WAVES_BACKEND_URI = process.env.VUE_APP_ENV_MODE
  ? process.env.VUE_APP_WAVES_BACKEND_DEV
  : process.env.VUE_APP_WAVES_BACKEND_PRODUCTION;

export const filterActions = {
  FETCH_REGIONS: async ({ commit }) => {
    try {
      const { data } = await axios.get(WAVES_BACKEND_URI+ "/regions");
      commit("setRegions", data.data);
    } catch (error) {
      commit("pushError");
    }
  },
  FETCH_MONTHS: async ({ commit }) => {
    try {
      const { data } = await axios.get(WAVES_BACKEND_URI+ "/months");
      commit("setMonths", data.data);
    } catch (error) {
      commit("pushError");
    }
  },
  FETCH_TYPES: async ({ commit }) => {
    try {
      const { data } = await axios.get(WAVES_BACKEND_URI+ "/eventtype");
      console.log("types:",data);
      commit("setTypes", data.data);
    } catch (error) {
      commit("pushError");
    }
  }
};

export const filterMutations = {
  setRegions: (state, regions) => {
    state.regions = regions;
  },
  setTypes: (state, types)=>{
      state.eventtypes= types
  }
};

export const filterGetters = {
  regions: state => {
    return state.regions;
  },
  types: state => {
    return state.eventtypes
  }
};

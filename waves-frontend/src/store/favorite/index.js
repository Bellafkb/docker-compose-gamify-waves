import axios from "axios";

const access_token = {
  headers: {
    authorization: "Bearer " + window.$cookies.get("waves_access_token")
  }
};

const WAVES_BACKEND_URI = process.env.VUE_APP_ENV_MODE
  ? process.env.VUE_APP_WAVES_BACKEND_DEV
  : process.env.VUE_APP_WAVES_BACKEND_PRODUCTION;

export const favoriteActions = {
  FETCH_MY_FAVORITES: async ({ commit }) => {
    try {
      const { data } = await axios.get(
        WAVES_BACKEND_URI + `/favorite`,
        access_token
      );
      commit("setFavorites", data.data);
    } catch (error) {
      commit("pushError", error.message);
    }
  }
};

export const favoriteGetters = {
  favorites(state) {
    return state.favorites;
  }
};

export const favoriteMutations = {
  setFavorites: (state, favorites) => {
    state.favorites = favorites;
  }
};

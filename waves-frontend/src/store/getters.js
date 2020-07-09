import { gamificationGetters } from "./gamification";
import { pooleventGetters } from "./poolevent";
import { authGetters } from "./auth";
import { applicationGetters } from "./application";
import { eventTypeGetters } from "./eventtype";
import { supporterGetters } from "./supporters";
import { filterGetters } from "./filter";
import { favoriteGetters } from "./favorite";

export default {
  ...pooleventGetters,
  ...gamificationGetters,
  ...authGetters,
  ...applicationGetters,
  ...eventTypeGetters,
  ...supporterGetters,
  ...filterGetters,
  ...favoriteGetters,
  getComments(state) {
    return state.comments;
  },
  isLogedIn(state) {
    return state.isLogedIn;
  },
  isAdmin(state) {
    return state.isAdmin;
  },
  getCurrentUser(state) {
    return state.currentUser;
  },
  getErrors(state) {
    return state.errors;
  },
  getRoles(state) {
    return state.roles;
  },
  getAllMonths: state => {
    return state.months;
  },
  getStatistic: state => {
    return state.statistic;
  },
  getRecomandations: state => {
    return state.recomandations;
  },
  getSuccessMessage: state => {
    return state.successMessage;
  },
  crew: state => {
    return {
      role: state.crewRole,
      city: state.crewCity
    };
  },
  APP_STATE: state => {
    return state.APP_STATE;
  }
};

import { gamificationMutations } from "./gamification";
import { authMutation } from "./auth";
import { supporterMutations } from "./supporters";
import { filterMutations } from "./filter";
import { favoriteMutations } from "./favorite";



export default {
  addPoolEvent(state, poolEvent) {
    state.poolEvents.push(poolEvent);
  },
  updatePoolEvents(state, poolEvents) {
    state.poolEvents = poolEvents;
  },
  setPoolEvent(state, poolEvent) {
    state.poolEvent = poolEvent;
  },
  setApplications(state, applications) {
    state.applications = applications;
  },
  addApplication: (state, application) => {
    state.applications.push(application);
  },
  acceptApplication: (state, application) => {
    let index = state.applications.findIndex(
      appl => appl.id === application.id
    );
    state.applications[index] = application;
  },
  rejectApplication: (state, application) => {
    let index = state.applications.findIndex(
      appl => appl.id === application.id
    );
    state.applications[index] = application;
  },
  setApplicationToWaitingList: (state, application) => {
    let index = state.applications.findIndex(
      appl => appl.id === application.id
    );
    state.applications[index] = application;
  },
  addComment: (state, comment) => {
    state.comments.unshift(comment);
  },
  setComments: (state, comments) => {
    state.comments = comments;
  },
  pushError: (state, error) => {
    state.errors.push(error);
  },
  pushSuccessMessage: (state, message) => {
    state.successMessage.push(message);
  },
  setAccessToken: (state, access_token) => {
    state.access_token = access_token;
  },
  setRoles: (state, roles) => {
    state.roles = roles;
  },
  setMonths: (state, months) => {
    state.months = months;
  },
  setUserStatistic: (state, statistic) => {
    state.statistic = statistic;
  },
  setRecomandations: (state, recomandations) => {
    state.recomandations = recomandations;
  },
  setLogedIn: (state, isLogedIn) => {
    state.isLogedIn = isLogedIn;
  },
  setCrewRoleCity: (state, crew) => {
    state.crewRole = crew.crewRole;
    state.crewCity = crew.crewCity;
  },
  resetError: state => {
    state.errors = [];
  },
  ...gamificationMutations,
  ...authMutation,
  ...supporterMutations,
  ...filterMutations,
  ...favoriteMutations
};

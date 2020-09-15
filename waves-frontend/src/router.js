import ApplicationHandlerView from "./views/ApplicationHandlerView.vue";
import PoolEventFormView from "./views/PoolEventFormView";
import NotificationsView from "./views/NotificationsView";
import DashboardView from "./views/DashboardView";
import PoolEventView from "./views/PoolEventView";
import PoolEventsView from "./views/PoolEventsView";
import ProfileView from "./views/ProfileView";
import AchievementWikiView from "./views/AchievementWikiView";
import InformationView from "./views/InformationView";
import RecomandationView from "./views/RecomandationView";
import Tutorial from "./views/Tutorial";
import ErrorView from "./views/ErrorView";
import Router from "vue-router";
import Vue from "vue";

Vue.use(Router);

const baseUrl = '/waves'

export default new Router({
  mode: "history",
  // eslint-disable-next-line no-sparse-arrays
  routes: [
    {
      path: baseUrl,
      name: "PoolEventsView",
      component: PoolEventsView
    },
    {
      path: `${baseUrl}/event/:id`,
      name: "pooleventview",
      component: PoolEventView
    },
    {
      path: `${baseUrl}/create`,
      name: "create",
      component: PoolEventFormView
    },
    {
      path: `${baseUrl}/event/:id/edit`,
      name: "EditPoolevent",
      component: PoolEventFormView
    },
    {
      path: `${baseUrl}/applications/:id`,
      name: "applications",
      component: ApplicationHandlerView
    },
    {
      path: `${baseUrl}/notifications`,
      name: "NotificationsView",
      component: NotificationsView
    },

    {
      path: `${baseUrl}/profile`,
      name: "Profile",
      component: ProfileView
    },
    {
      path: `${baseUrl}/wiki/badges`,
      name: "wiki",
      component: AchievementWikiView
    },
    {
      path: `${baseUrl}/info`,
      name: "information",
      component: InformationView
    },
    {
      path: `${baseUrl}/dashboard`,
      name: "dashboardView",
      component: DashboardView
    },
    ,
    {
      path: `${baseUrl}/recomandations`,
      name: "recomandation",
      component: RecomandationView
    },
    {
      path: `${baseUrl}/tutorial`,
      name: "Tutorial",
      component: Tutorial
    },
    { path: "*", component: ErrorView }
  ]
});

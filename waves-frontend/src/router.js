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
      path: "/",
      name: "PoolEventsView",
      component: PoolEventsView
    },
    {
      path: "/event/:id",
      name: "pooleventview",
      component: PoolEventView
    },
    {
      path: "/create",
      name: "create",
      component: PoolEventFormView
    },
    {
      path: "/event/:id/edit",
      name: "EditPoolevent",
      component: PoolEventFormView
    },
    {
      path: "/applications/:id",
      name: "applications",
      component: ApplicationHandlerView
    },
    {
      path: "/notifications",
      name: "NotificationsView",
      component: NotificationsView
    },

    {
      path: "/profile",
      name: "Profile",
      component: ProfileView
    },
    {
      path: "/wiki/badges",
      name: "wiki",
      component: AchievementWikiView
    },
    {
      path: "/info",
      name: "information",
      component: InformationView
    },
    {
      path: "/dashboard",
      name: "dashboardView",
      component: DashboardView
    },
    ,
    {
      path: "/recomandations",
      name: "recomandation",
      component: RecomandationView
    },
    { path: "*", component: ErrorView }
  ]
});

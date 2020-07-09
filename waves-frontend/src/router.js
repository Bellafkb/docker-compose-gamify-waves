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

export default new Router({
  mode: "history",
  // eslint-disable-next-line no-sparse-arrays
  routes: [
    {
      path: "/waves",
      name: "PoolEventsView",
      component: PoolEventsView
    },
    {
      path: "/waves/event/:id",
      name: "pooleventview",
      component: PoolEventView
    },
    {
      path: "/waves/create",
      name: "create",
      component: PoolEventFormView
    },
    {
      path: "/waves/event/:id/edit",
      name: "EditPoolevent",
      component: PoolEventFormView
    },
    {
      path: "/waves/applications/:id",
      name: "applications",
      component: ApplicationHandlerView
    },
    {
      path: "/waves/notifications",
      name: "NotificationsView",
      component: NotificationsView
    },

    {
      path: "/waves/profile",
      name: "Profile",
      component: ProfileView
    },
    {
      path: "/waves/wiki/badges",
      name: "wiki",
      component: AchievementWikiView
    },
    {
      path: "/waves/info",
      name: "information",
      component: InformationView
    },
    {
      path: "/waves/dashboard",
      name: "dashboardView",
      component: DashboardView
    },
    ,
    {
      path: "/waves/recomandations",
      name: "recomandation",
      component: RecomandationView
    },
    { path: "*", component: ErrorView }
  ]
});

import jwt from "jsonwebtoken";

export const APP_STATE = {
  ADMIN: "ADMIN",
  VOLUNTEER_MANAGER: "VOLUNTEERMANAGER",
  SUPPORTER: "SUPPORTER",
  LOGGEDOUT: "LOGGEDOUT"
};

export const authActions = {
  SET_ACCESS_TOKEN: async ({ commit }, access_token) => {
    await commit("setAccessToken", access_token);
  },
  SET_ROLES: ({ commit }, roles) => {
    commit("setRoles", roles);
  },
  IS_LOGED_IN: ({ commit }, isLogedIn) => {
    commit("setLogedIn", isLogedIn);
  },
  SET_CREW_ROLE_CITY: ({ commit }, crew) => {
    commit("setCrewRoleCity", crew);
  },
  LOGOUT: ({ commit }) => {
    window.$cookies.remove("full_name");
    window.$cookies.remove("roles");
    window.$cookies.remove("full_name");
    window.$cookies.remove("first_name");
    window.$cookies.remove("CREW_CITY");
    window.$cookies.remove("CREW_ROLE");
    window.$cookies.remove("WAVES_JWT");
    window.$cookies.remove("last_name");
    window.$cookies.remove("user_id");
    window.$cookies.remove("access_token");
  },
  CHECK_ACCESS: ({ commit }, statusCode) => {
    if (statusCode === 401) {
      commit("logout");
      window.location.href = "https://stage.vivaconagua.org";
    } else if (statusCode === 403) {
      commit("pushErrors", "Unauthorized");
    }
  }
};

export const authMutation = {
  setUser: (state, waves_jwt) => {
    const { userId, firstName, lastName, fullName, crew, roles } = jwt.decode(
      waves_jwt,
      "secret"
    );
    const { firstRole, secondRole, crewRoleName } = roles;
    localStorage.setItem("userId", userId);
    localStorage.setItem("firstName", firstName);
    localStorage.setItem("lastName", lastName);
    localStorage.setItem("fullName", fullName);
    localStorage.setItem("crewId", crew.crewId);
    localStorage.setItem("crewName", crew.crewName);
    localStorage.setItem("crewRoleName", crewRoleName);
    localStorage.setItem("firstRole", firstRole.role);
    localStorage.setItem("secondRole", secondRole.role);
  },
  setAccessToken: (state, accessToken) => {
    state.access_token = {
      headers: {
        Authorization: `Bearer ${accessToken}`
      }
    };
  },
  logout: () => {
    localStorage.removeItem("userId");
    localStorage.removeItem("firstName");
    localStorage.removeItem("lastName");
    localStorage.removeItem("fullName");
    localStorage.removeItem("crewId");
    localStorage.removeItem("crewName");
    localStorage.removeItem("crewRoleName");
    localStorage.removeItem("firstRole");
    localStorage.removeItem("secondRole");
    window.$cookies.remove("waves_access_token");
  },
  setAppState: state => {
    if (window.$cookies.get("waves_access_token")) {
      const crewRoleName = localStorage.getItem("crewRoleName");
      const secondRole = localStorage.getItem("secondRole");
      const firstRole = localStorage.getItem("firstRole");

      if (secondRole) {
        if (secondRole.toUpperCase() == APP_STATE.ADMIN) {
          state.appState = APP_STATE.ADMIN;
          return
        }
      }
      if (crewRoleName) {
        if (crewRoleName.toUpperCase() == APP_STATE.VOLUNTEER_MANAGER) {
          state.appState = APP_STATE.VOLUNTEER_MANAGER;
          return
        }
      }

      if (firstRole) {
        if (firstRole.toUpperCase() == APP_STATE.SUPPORTER) {
          state.appState = APP_STATE.SUPPORTER;
        }
      }
    } else {
      console.log(APP_STATE.LOGGEDOUT);
      state.appState = APP_STATE.LOGGEDOUT;
    }
  }
};

export const authGetters = {
  getUser: () => {
    return {
      userId: localStorage.getItem("userId"),
      firstName: localStorage.getItem("firstName"),
      lastName: localStorage.getItem("lastName"),
      fullName: localStorage.getItem("fullName"),
      crewId: localStorage.getItem("crewId"),
      crewName: localStorage.getItem("crewName"),
      crewRoleName: localStorage.getItem("crewRoleName"),
      firstRole: localStorage.getItem("firstRole"),
      secondRole: localStorage.getItem("secondRole")
    };
  },
  getAccessToken: state => {
    return state.access_token;
  },
  appState: state => {
    return state.appState;
  }
};


export const eventTypeMutations = {
  setEventTypes: (state, eventtypes) => {
    state.eventtypes = eventtypes;
  }
};

export const eventTypeGetters = {
  eventtypes: state => {
    return state.eventtypes;
  }
};

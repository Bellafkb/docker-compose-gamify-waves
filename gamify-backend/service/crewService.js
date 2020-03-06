const axios = require("axios");

exports.fetchCrewByUserId = async userId => {
    try {
        const user = await fetchUserById(userId)
        const {profiles} = user         
        const crew = profiles[0].supporter.crew
        const {id,name} = crew
        return {id,name}
    } catch (error) {
        throw error;
    }
};

fetchUserById = async (user_id) => {
    try {
      const { data } = await axios.post(
        `https://stage.vivaconagua.org/drops/rest/user/${user_id}?client_id=wavesdev&client_secret=wavesdev`,
        {}
      );
      return data;
    } catch (error) {
      throw error
    }
  };
  

exports.getAllCrews = () => {};

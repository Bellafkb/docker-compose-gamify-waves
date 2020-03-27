const axios = require("axios");
const { fetchAllUsers } = require("../service/usersService");

exports.getAllUsers = async (req, res, next) => {
  try {
    const users = await fetchAllUsers();
    let response = users.map(({ id, profiles }) => {
      return {
        userId: id,
        fullName: profiles[0] ? profiles[0].supporter.fullName : "ERROR"
      };
    });
    req.data = response;
    next();
  } catch (error) {
    req.error = error;
    next();
  }
};

exports.fetchUserById = async (req, res) => {
  try {
    const { data } = await axios.post(
      `${process.env.OAUTH_BASE_URI}/drops/rest/user/${req.params.id}?client_id=${process.env.CLIENT_ID}&client_secret=${process.env.CLIENT_SECRET}`,
      {}
    );

    console.log(
      `${process.env.OAUTH_BASE_URI}/drops/rest/user/${req.params.id}?client_id=${process.env.CLIENT_ID}&client_secret=${process.env.CLIENT_SECRET}`
    );
    res.status(200).json({ success: true, user: data });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};

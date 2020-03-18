const { fetchProfile } = require("../service/usersService");
const { getUserAccessToken } = require("../service/oauthService");
const jwt = require("jsonwebtoken");

exports.verify = async (req, res, next) => {
  try {
    const { authorization } = req.headers;
    if (authorization) {
      const [bearer, token] = await authorization.split(" ");
      if (token === null) {
        res.status(401).json({
          success: false,
          error: "unauthorized, access token required"
        });
      }
      const { userId } = jwt.decode(token, "secret");
      console.log(userId);
      getUserAccessToken(userId, async (error, access_token) => {
        console.log("-->", access_token);
        const profile = await fetchProfile(access_token);
        req.user = profile;
        return next(null, profile);
      });
    } else {
      res.status(401).json({
        success: false,
        error: "unauthorized, access token required"
      });
    }
  } catch (error) {
    res.status(401).json({
      success: false,
      error: error.message
    });
  }
};

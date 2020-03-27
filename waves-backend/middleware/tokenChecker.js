const { fetchProfile } = require("../service/usersService");
const { getUserAccessToken } = require("../service/oauthService");
const jwt = require("jsonwebtoken");

exports.verify = async (req, res, next) => {
  try {
    const { authorization } = req.headers;
    if (authorization) {
      const [bearer, token] = await authorization.split(" ");
      console.log(token);
      if (token === null) {
        res.status(401).json({
          success: false,
          error: "unauthorized, access token required"
        });
      }
      const { userId } = jwt.decode(token, "secret");
      console.log(userId);
      getUserAccessToken(userId, async (error, access_token) => {
        if (error) {
          res.status(401).json({
            success: false,
            error: error.message
          });
        }
        const profile = await fetchProfile(access_token);
        console.log(profile);
        req.user = profile;
        next(null, profile);
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

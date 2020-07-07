const { fetchProfile, fetchToken } = require("../service/usersService");
const jwt = require("jsonwebtoken");
const redis = require("redis");

exports.authenticate = async (req, res) => {
  try {
    const { code, state } = req.query;
    console.log(code, state);
    const { access_token, refresh_token, token_type } = await fetchToken(code);
    console.log(access_token);
    
    const data = await fetchProfile(access_token);
    console.log(data);
    saveUserSession(data.userId, access_token)
    res.cookie(
      "waves_access_token",
      await signWavesAccessToken(data)
    );
    res.redirect(state);
  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message,
      error: error.response.data
    });
  }
};

const signWavesAccessToken = profile => {
  try {
    return jwt.sign(profile, "secret");
  } catch (error) {
    throw error.message;
  }
};

const saveUserSession = async (id, access_token) => {
  try {
    const redisClient = await redis.createClient(
      process.env.CACHE_REDIS_PORT,
      process.env.CACHE_REDIS_HOST
    );
    console.log("-->",access_token,id);
    redisClient.set(id.toString(), access_token.toString());
    redisClient.get(id.toString(),(data)=>{
      console.log(data);
    });
  } catch (error) {
    throw error;
  }
};

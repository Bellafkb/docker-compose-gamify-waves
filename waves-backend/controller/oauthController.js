const { fetchProfile, fetchToken } = require("../service/usersService");
const jwt = require("jsonwebtoken");
const redis = require("redis");

exports.authenticate = async (req, res) => {
  try {
    const { code, state } = req.query;
    console.log(code);

    const { access_token, refresh_token, token_type } = await fetchToken(code);
    console.log("fetch token", access_token);
    const data = await fetchProfile(access_token);
    saveUserSession(data.id, data);
    res.cookie(
      "waves_access_token",
      await signWavesAccessToken(data, access_token)
    );
    res.redirect(state);
  } catch (error) {
    console.log(error);
    res.status(400).json({
      success: false,
      error: error.message
    });
  }
};

const signWavesAccessToken = async profile => {
  try {
    const { id: userId, profiles, roles: supporterRoles } = profile;
    const [firstRole, secondRole] = supporterRoles;
    const { supporter } = profiles[0];
    const { confirmed } = profiles[0];
    const { firstName, lastName, fullName, crew, roles } = supporter;
    const { id: crewId, name: crewName } = crew;
    const { name: crewRoleName } = roles[0];

    return jwt.sign(
      {
        userId,
        confirmed,
        firstName,
        lastName,
        fullName,
        crew: {
          crewId,
          crewName
        },
        roles: {
          crewRoleName,
          firstRole,
          secondRole
        }
      },
      "secret"
    );
  } catch (error) {
    throw error.message;
  }
};

const saveUserSession = async (id, profile) => {
  try {
    const redisClient = await redis.createClient(
      process.env.CACHE_REDIS_PORT,
      process.env.CACHE_REDIS_HOST
    );
    redisClient.set(id, JSON.stringify(profile));
  } catch (error) {
    throw error;
  }
};

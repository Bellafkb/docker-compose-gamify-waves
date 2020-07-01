exports.getUserAccessToken = async (userId, callback) => {
  try {
    global.redisClient.get(userId, (err, access_token) => {
      callback(err, access_token);
    });
  } catch (error) {
    throw error;
  }
};

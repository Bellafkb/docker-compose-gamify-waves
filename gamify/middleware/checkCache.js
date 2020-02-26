exports.checkCache = (key, tableName, callback) => {
  try {
    global.redis_client.get(`${key}_${tableName}`, (error, data) => {
      if (error) {
        callback(error);
      }
      callback(null, JSON.parse(null, data));
    });
  } catch (error) {
    callback(error);
  }
};

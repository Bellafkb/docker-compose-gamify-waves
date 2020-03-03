const { createCacheKey } = require("../helper");
exports.saveToCache = (key, tableName, data) => {
  let key = createCacheKey(key, tableName);
  global.redis_client.setex(
    key,
    60,
    JSON.parse(data),
    ((error, response) = {
      if(error) {
        console.log(error.message);
      }
    })
  );
};

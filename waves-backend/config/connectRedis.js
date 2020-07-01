const redis = require("redis");

(async () => {
  global.redisClient = redis.createClient("6379", "redis");
})();

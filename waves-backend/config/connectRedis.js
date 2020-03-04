const redis = require("redis");
const port_redis = "6379";

/*(async () => {
  try {
    global.redis_client = await redis.createClient(port_redis);
    console.log(`cache redis connected to port ${port_redis}`);
  } catch (error) {
    console.log(error);
  }
})();*/


(async () => {
  let publisher = await redis.createClient(port_redis);
  publisher.publish(
    "WAVES_BACKEND",
    JSON.stringify({ scoop: "hello world" })
  );
  publisher.publish(
    "1",
    JSON.stringify({ scoop: "hello world" })
  );
  publisher.publish(
    "2",
    JSON.stringify({ scoop: "hello world" })
  );
})()

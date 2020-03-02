const redis = require("redis");
const port_redis = "6379";

(async () => {
  try {
    let subscriber = await redis.createClient(port_redis);
    console.log(`cache redis connected to port ${port_redis}`);
    subscriber.on("message", function (channel, message) {
      console.log(
        "Message: " + message + " on channel: " + channel + " is arrive!"
      );
    });
    subscriber.subscribe("CREATE_POOLEVENT");
    subscriber.subscribe("CREATE_APPLICATION");
    subscriber.subscribe("CREATE_COMMENT");
  } catch (error) {
    console.log(error);
  }
})();

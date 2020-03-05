const redis = require("redis")
const port_redis = "6379";
(async () => {
  let subscriber = await redis.createClient(port_redis);
  subscriber.on("message", function (channel, message) {
    console.log(
      message + " on channel: " + channel + " is arrive!"
    );
  });

  subscriber.subscribe("WAVES");

})()

const subscriber = require("redis")
const port_redis = "6379";

console.log(`cache redis connected to port ${port_redis}`);
subscriber.on("message", function(channel, message) {
  console.log(
     message + " on channel: " + channel + " is arrive!"
  );
});

subscriber.subscribe("WAVES_BACKEND");

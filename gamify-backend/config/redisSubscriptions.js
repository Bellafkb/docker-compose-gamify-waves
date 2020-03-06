const redis = require("redis");
const { handleMessage } = require("../service/messageBrokerService");

const port_redis = "6379";
(async () => {
  let subscriber = await redis.createClient(port_redis);
  subscriber.on("message", async function(channel, message) {
    console.log(`message: ${message}, on channel: ${channel}`);
    const { category, userId, sourceId } = JSON.parse(message);
    if (category && userId && sourceId) {
      await handleMessage(category, userId, sourceId);
    } else {
      console.log(
        `invalide message category: ${category}, userId: ${userId}, sourceId: ${sourceId}`
      );
    }
  });

  subscriber.subscribe("WAVES");
})();

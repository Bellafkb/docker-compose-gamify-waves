const redis = require("redis");
const port_redis = "6379";

console.log(`cache redis connected to port ${port_redis}`);

exports.publish = async (channel, action, userId, sourceId) => {
  try {
    console.log(channel, action, userId, sourceId);
    const redis_client = await redis.createClient({
      host: "redis",
      port: port_redis
    });
    redis_client.publish(
      channel,
      JSON.stringify({
        action,
        userId,
        sourceId
      })
    );
  } catch (error) {
    throw error;
  }
};

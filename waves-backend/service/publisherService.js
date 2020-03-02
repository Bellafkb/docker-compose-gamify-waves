const redis = require("redis")
const port_redis = "6379";

console.log(`cache redis connected to port ${port_redis}`);

exports.publishEventCreated = async () => {
    const redis_client = await redis.createClient(port_redis)
    redis_client.publish("CREATE_POOLEVENT",JSON.stringify({
        user_id: "test"
    }))
}

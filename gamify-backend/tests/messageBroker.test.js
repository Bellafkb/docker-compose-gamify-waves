const { handleMessage } = require("../service/messageBrokerService");
const mariadb = require("mariadb");
const { generateUuid } = require("../helper");

const connect = async () => {
  try {
    const pool = mariadb.createPool({
      queueLimit: 200,
      host: "localhost",
      user: "root",
      password: "password",
      database: "gamifydb"
    });
    global.conn = await pool.getConnection();
  } catch (error) {
    throw error.message;
  }
};

const userid = "8d411dc4-e76f-4d0e-a027-056a0bc43be5"

test("handleMessage", async () => {
  await connect();
  const response = await handleMessage(
    "EVENT_CREATED",
    //"4a74141e-c2c0-46a0-9c0c-84bef8be7d0f",
    userid,
    generateUuid()
  );
  expect(response).toBe(true);
  await global.conn.end();
});

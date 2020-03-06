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

test("handleMessage", async () => {
  await connect();
  const response = await handleMessage(
    "APPLICATION",
    generateUuid(),
    generateUuid()
  );
  expect(response).toBe(true);
  await global.conn.end();
});

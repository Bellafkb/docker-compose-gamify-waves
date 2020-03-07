const { incrementScorebyUserId } = require("../service/progressService");

const mariadb = require("mariadb");

const CREWID = "CREWTESTID";

const connect = async () => {
  try {
    const pool = mariadb.createPool({
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

test("increment progress", async () => {
  await connect()
  const response = await incrementScorebyUserId(
    "4a74141e-c2c0-46a0-9c0c-84bef8be7d0f",
    "poolevents",
    40
  );
  expect(response.user_id).toBe("4a74141e-c2c0-46a0-9c0c-84bef8be7d0f");
});

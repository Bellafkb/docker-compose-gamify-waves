const {
  createLeaderboardEntry,
  updateLeaderboardEntryByCrewId
} = require("../service/crewRankingService");

const mariadb = require("mariadb");

const CREWID = "";

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

test("create new crew leaderboard entry", async () => {
  await connect();
  const { affectedRows } = await createLeaderboardEntry("CREWTESTID");
  expect(affectedRows).toBe(1);
  global.conn.end();
});

test("update crew leaderboard entry", async () => {
  await connect();
  const { affectedRows } = await updateLeaderboardEntryByCrewId(
    "CREWTESTID",
    2
  );
  expect(typeof affectedRows).toBe(typeof 1);
  global.conn.end();
});

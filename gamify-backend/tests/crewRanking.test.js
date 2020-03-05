const {
  createLeaderboardEntry,
  incrementLeaderBoardEntryByCrewId: updateLeaderboardEntryByCrewId,
  handleAction,
  getCrewLeaderboard
} = require("../service/crewRankingService");

const mariadb = require("mariadb");

const CREWID = "CREWTESTID";

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

/*test("create new crew leaderboard entry", async () => {
  await connect();
  const { affectedRows } = await createLeaderboardEntry("CREWTESTID");
  expect(affectedRows).toBe(1);
  global.conn.end();
});*/
/*
test("update crew leaderboard entry", async () => {
  await connect();
  const { affectedRows } = await updateLeaderboardEntryByCrewId(
    "CREWTESTID",
    2
  );
  expect(typeof affectedRows).toBe(typeof 1);
  global.conn.end();
});*/


test("handleAction", async () => {
  await connect();
  const response = await handleAction("READ",CREWID);
  expect(response[0].id_action).toBe("READ");
  await global.conn.end();
});


test("fetch crew leaderboard", async () => {
  await connect();
  const leaderboard = await getCrewLeaderboard();
  expect(leaderboard.length>0).toBe(true);
  await global.conn.end();
});
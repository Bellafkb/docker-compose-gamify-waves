const {
  createLeaderboardEntry,
  incrementLeaderBoardEntryByCrewId,
  handleAction,
  getCrewLeaderboard
} = require("../service/crewRankingService");
const { generateUuid } = require("../helper");

const mariadb = require("mariadb");

const CREWID = generateUuid();

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

test("create new crew leaderboard entry", async () => {
  await connect();
  const { affectedRows } = await createLeaderboardEntry(CREWID);
  expect(affectedRows).toBe(1);
  global.conn.end();
});

test("update crew leaderboard entry", async () => {
  await connect();
  const { affectedRows } = await incrementLeaderBoardEntryByCrewId(
    generateUuid(),
    20
  );
  expect(typeof affectedRows).toBe(typeof 1);
  global.conn.end();
});

test("handleAction", async () => {
  await connect();
  const response = await handleAction("READ", generateUuid(), generateUuid());
  expect(response).toBe(true);
  await global.conn.end();
});

test("get crew leaderboard", async () => {
  await connect();
  const leaderboard = await getCrewLeaderboard();
  expect(leaderboard.length != undefined).toBe(true);
  await global.conn.end();
});

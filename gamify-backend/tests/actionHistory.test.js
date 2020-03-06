const {
  isDuplicate,
  saveActionHistory
} = require("../service/actionHistoryService");
const { generateUuid } = require("../helper");
const mariadb = require("mariadb");

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

test("is not Duplicate", async () => {
  await connect();
  const response = await isDuplicate(
    generateUuid(),
    generateUuid(),
    "APPLICATION"
  );
  expect(response.length === 0).toBe(true);
  global.conn.end();
});

const crewId = generateUuid();
const userId = generateUuid();
const sourceId = generateUuid();

test("save to history", async () => {
  await connect();
  const response = await saveActionHistory(
    crewId,
    userId,
    sourceId,
    "APPLICATION"
  );
  expect(typeof response).toBe(typeof {});
  global.conn.end();
});

test("is Duplicate", async () => {
  await connect();
  const response = await isDuplicate(crewId, sourceId, "APPLICATION");
  expect(response.length > 0).toBe(true);
  global.conn.end();
});

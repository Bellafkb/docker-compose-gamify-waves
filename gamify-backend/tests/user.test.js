const {initUserProfile,isNewCrew} = require("../service/userService");
const {generateUuid} = require("../helper");


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

/**
 *test("initUserProfile", async () => {
  await connect();
  const response = await initUserProfile(CREWID);
  expect(response[0].id_action).toBe("READ");
  await global.conn.end();
});
 
 * 
 */

test("isNewCrew", async () => {
  await connect();
  const response = await isNewCrew(CREWID);
  expect(response).toBe(false);
  await global.conn.end();
});

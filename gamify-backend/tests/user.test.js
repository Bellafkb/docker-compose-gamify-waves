const {
  initUserProfile,
  isNewCrew,
  isNewUser,
  createUser
} = require("../service/userService");
const { generateUuid } = require("../helper");

const mariadb = require("mariadb");

const CREWID = generateUuid();
const USERID = generateUuid();


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

test("isNewUser", async () => {
  await connect();
  const response = await isNewUser("4a74141e-c2c0-46a0-9c0c-84bef8be7d0f");
  expect(response).toBe(true);
  await global.conn.end();
});

test("create new user", async () => {
  await connect();
  const {userId} = await createUser(
    USERID,
    CREWID
  );
  expect(userId).toBe(USERID);
  await global.conn.end();
});

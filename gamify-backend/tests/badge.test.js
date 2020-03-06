const { createBadge } = require("../service/badgeService");

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

test("create badge", async () => {
  await connect()
  const response = await createBadge(
    "informed",
    "onboarding information",
    "poolevents",
    "//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png"
  );
  expect(response.name).toBe("informed");
});

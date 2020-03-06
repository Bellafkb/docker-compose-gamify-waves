const mariadb = require("mariadb")
const {
  createAchievement
} = require("../service/achievementService");

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



test("achievement", async () => {
  await connect()
  const response = await createAchievement("scoop","lorem lorem","poolevents","loremscoop",30)
  expect(response.badge.name).toBe("scoop")
});
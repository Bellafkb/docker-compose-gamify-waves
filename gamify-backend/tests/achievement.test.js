const mariadb = require("mariadb");
const {
  createAchievement,
  initNewUserAchievement,
  initNewAchievementForUsers
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
  await connect();
  const response = await createAchievement(
    "new comment",
    "comment",
    "comments",
    "loremscoop",
    3
  );
  expect(response.badge.name).toBe("new comment");
});

/*
test("new user create challengeprogress", async () => {
  await connect();
  const response = await initNewUserAchievement(
    "4a74141e-c2c0-46a0-9c0c-84bef8be7d0f"
  );
  expect(response).toBe(true);
});
*/
/*
test("create challengeprogress for new achievement", async () => {
  await connect();
  const response = await initNewAchievementForUsers(
    "03b388d7-b9aa-4bfa-8bb4-bb749ea156fb"
  );
  expect(response).toBe(true);
});*/

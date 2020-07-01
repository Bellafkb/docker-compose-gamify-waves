const { connectToDb } = require("../config/connectMysql");

test("mysql", async () => {
  const conn = await connectToDb();
  const achievements = await conn.query("select * from achievements");
  await conn.end();
  expect(achievements.length > 0).toBe(true);
});


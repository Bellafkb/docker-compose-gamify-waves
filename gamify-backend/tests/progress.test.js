const {
  incrementScorebyUserId,
  setCompletedChallenges,
  getCompletedChallenges,
  handleAchievementProgress
} = require("../service/progressService");

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
/*
test("increment progress", async () => {
  await connect();
  const response = await incrementScorebyUserId(
    "4a74141e-c2c0-46a0-9c0c-84bef8be7d0f",
    "poolevents",
    40
  );
  expect(response.user_id).toBe("4a74141e-c2c0-46a0-9c0c-84bef8be7d0f");
});
*/
/*
test("set progress to completed", async () => {
  await connect();
  const response = await setCompletedChallenges([
    { idcp: "1a71d6a5-cadf-4298-ba95-36ca24b81dc1" },
    { idcp: "1df8ff58-0ed0-41a0-bc2c-2116a3ad257a" }
  ]);
  expect(response).toStrictEqual([
    { idcp: "1a71d6a5-cadf-4298-ba95-36ca24b81dc1" },
    { idcp: "1df8ff58-0ed0-41a0-bc2c-2116a3ad257a" }
  ]);
});

test("get progress to completed", async () => {
  await connect();
  const response = await getCompletedChallenges(
    "4a74141e-c2c0-46a0-9c0c-84bef8be7d0f"
  );
  expect(
    response[0].idcp.length === "4a74141e-c2c0-46a0-9c0c-84bef8be7d0f".length
  ).toBe(true);
});


test("handle achievement event", async () => {
  await connect();
  const response = await incrementScorebyUserId(
    "4a74141e-c2c0-46a0-9c0c-84bef8be7d0f"
  );
  expect(
    response[0].idcp.length === "4a74141e-c2c0-46a0-9c0c-84bef8be7d0f".length
  ).toBe(true);
});
*/
/*
test("simulate create poolevent ", async () => {
  await connect();
  const res = await incrementScorebyUserId(
    "8d411dc4-e76f-4d0e-a027-056a0bc43be5",
    "poolevents"
  );
  const response = await getCompletedChallenges(
    "8d411dc4-e76f-4d0e-a027-056a0bc43be5"
  );
  await setCompletedChallenges(response);
  expect(res).toBe(true);
});

test("simulate new comments ", async () => {
  await connect();
  const res = await incrementScorebyUserId(
    "8d411dc4-e76f-4d0e-a027-056a0bc43be5",
    "comments"
  );
  const response = await getCompletedChallenges(
    "8d411dc4-e76f-4d0e-a027-056a0bc43be5"
  );
  await setCompletedChallenges(response);
  expect(res).toBe(true);
});*/

test("handle achievement progress", async () => {
  await connect();
  const res = await handleAchievementProgress(
    "8d411dc4-e76f-4d0e-a027-056a0bc43be5",
    "COMMENT"
  )
  expect(res).toBe(true);
});

const {
  incrementScorebyUserId,
  setCompletedChallenges,
  getCompletedChallenges,
  handleAchievementProgress
} = require("../service/progressService");

const mariadb = require("mariadb");

const CREWID = "CREWTESTID";




test("handle achievement progress", async () => {
  const res = await handleAchievementProgress(
    "8d411dc4-e76f-4d0e-a027-056a0bc43be5",
    "COMMENT"
  )
  expect(res).toBe(true);
});

const {
  createAchievement,
} = require("../service/achievementService");



test("achievement", async () => {
  const response = await createAchievement(
    "new comment",
    "comment",
    "comments",
    "loremscoop",
    3
  );
  expect(response.badge.name).toBe("new comment");
});

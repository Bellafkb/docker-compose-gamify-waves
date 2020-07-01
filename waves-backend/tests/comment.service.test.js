const { saveComment } = require("../service/commentService");
const { TEST_USER, generateUuid } = require("../helper");

process.env.OAUTH_BASE_URI = "https://stage.vivaconagua.org";
process.env.CLIENT_ID = "wavesdev";
process.env.CLIENT_SECRET = "wavesdev";
process.env.REDIRECT_URI = "http://localhost/waves/api/v1/oauth";
const userId = TEST_USER.userId;

test("save event", async () => {
  await saveComment("TEST TEXT", userId, generateUuid(), (error, event) => {
    if (error) {
      throw error;
    }
    expect(event.user_id).toBe(userId);
  });
});

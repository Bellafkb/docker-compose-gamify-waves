const { savePoolevent } = require("../service/pooleventService");
const { TEST_USER } = require("../helper");

process.env.OAUTH_BASE_URI = "https://stage.vivaconagua.org";
process.env.CLIENT_ID = "wavesdev";
process.env.CLIENT_SECRET = "wavesdev";
process.env.REDIRECT_URI = "http://localhost/waves/api/v1/oauth";
const userId = TEST_USER.userId;


test("save event", () => {
  savePoolevent(
    "test",
    1231231312,
    123141234231,
    12123123123,
    13112314,
    13123123,
    "website",
    1,
    1,
    userId,
    321,
    1,
    (error, event) => {
      if (error) {
        throw error;
      }
      expect(event.name).toBe("test");
    }
  );
});

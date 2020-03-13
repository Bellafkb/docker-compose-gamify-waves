const { generateUuid } = require("../helper");
const { saveVote,deleteVote } = require("../service/voteService");

//const userId = generateUuid()


const userId = "8d411dc4-e76f-4d0e-a027-056a0bc43be5"

process.env.OAUTH_BASE_URI = "https://stage.vivaconagua.org";
process.env.CLIENT_ID = "wavesdev";
process.env.CLIENT_SECRET = "wavesdev";
process.env.REDIRECT_URI = "http://localhost/waves/api/v1/oauth";

test("save crew by user_id", async () => {
  saveVote(userId, 140, (err, v) => {
    expect(v.user_id == userId).toBe(true);
  });
});


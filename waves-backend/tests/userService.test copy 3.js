const mariadb = require("mariadb");
const { fetchUserById,fetchCrewByUserId } = require("../service/usersService");

process.env.OAUTH_BASE_URI="https://stage.vivaconagua.org"
process.env.CLIENT_ID="wavesdev"
process.env.CLIENT_SECRET="wavesdev"
process.env.REDIRECT_URI="http://localhost/waves/api/v1/oauth"

test("fetch user by id", () => {
  fetchUserById("4a74141e-c2c0-46a0-9c0c-84bef8be7d0f", (error, user) => {
    expect(user.id).toBe("4a74141e-c2c0-46a0-9c0c-84bef8be7d0f");
  });
});

test("fetch crew by user_id", () => {
  fetchCrewByUserId("4a74141e-c2c0-46a0-9c0c-84bef8be7d0f", (error, crew) => {
    expect(typeof(crew)).toBe(Array);
  });
});
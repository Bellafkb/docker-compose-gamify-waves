const {
  isNewUser,
  createUser
} = require("../service/userService");
const { generateUuid } = require("../helper");

const CREWID = generateUuid();
const USERID = generateUuid();

test("isNewUser", async () => {
  const response = await isNewUser("8d411dc4-e76f-4d0e-a027-056a0bc43be5");
  expect(response).toBe(false);
});

test("create new user", async () => {
  const {userId} = await createUser(
    USERID,
    CREWID
  );
  expect(userId).toBe(USERID);
});

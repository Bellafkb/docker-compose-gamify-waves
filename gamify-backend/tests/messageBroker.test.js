const { handleMessage } = require("../service/messageBrokerService");
const { generateUuid } = require("../helper");

const userid = "8d411dc4-e76f-4d0e-a027-056a0bc43be5";

test("handleMessage", async () => {
  const response = await handleMessage("EVENT_CREATED", userid, generateUuid());
  expect(response).toBe(true);
});

const { saveActionHistory } = require("../service/actionHistoryService");
const { generateUuid } = require("../helper");

const crewId = generateUuid();
const userId = generateUuid();
const sourceId = generateUuid();

test("save to history", async () => {
  const response = await saveActionHistory(
    crewId,
    "8d411dc4-e76f-4d0e-a027-056a0bc43be5",
    sourceId,
    "READ"
  );
  expect(typeof response).toBe(typeof {});
});

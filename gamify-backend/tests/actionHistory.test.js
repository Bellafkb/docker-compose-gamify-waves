const {
  isDuplicate,
  saveActionHistory
} = require("../service/actionHistoryService");
const { generateUuid } = require("../helper");


const crewId = generateUuid();
const userId = generateUuid();
const sourceId = generateUuid();

test("save to history", async () => {
  const response = await saveActionHistory(
    "15b0f223-1625-4948-8d7d-67c7f1653129",
    "8d411dc4-e76f-4d0e-a027-056a0bc43be5",
    "fde60f19-0c4a-4f2b-8590-ab0f27b673ff",
    "READ"
  );
  expect(typeof response).toBe(typeof {});
});
const {
  getTodaysCreatedEvents,
  saveTrophies
} = require("../service/intervalTrophieService");
const { generateUuid } = require("../helper");


test("get todays events", async () => {
  const events = await getTodaysCreatedEvents();
  expect(events.length > 0).toBe(true);
});


test("get score", async () => {
  const events = await getTodaysCreatedEvents();
  const scores = await saveTrophies(events);
  expect(scores).toBe(true);
});


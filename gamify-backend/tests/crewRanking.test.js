const {
  createLeaderboardEntry,
  incrementLeaderBoardEntryByCrewId,
  handleAction,
  getCrewLeaderboard
} = require("../service/crewRankingService");
const { generateUuid } = require("../helper");

const CREWID = generateUuid();


test("create new crew leaderboard entry", async () => {
  const { affectedRows } = await createLeaderboardEntry(CREWID);
  expect(affectedRows).toBe(1);
});

test("update crew leaderboard entry", async () => {
  const { affectedRows } = await incrementLeaderBoardEntryByCrewId(
    generateUuid(),
    20
  );
  expect(typeof affectedRows).toBe(typeof 1);
});

test("handleAction", async () => {
  const response = await handleAction("READ", generateUuid(), generateUuid());
  expect(response).toBe(true);
});

test("get crew leaderboard", async () => {
  const leaderboard = await getCrewLeaderboard();
  expect(leaderboard.length != undefined).toBe(true);
});

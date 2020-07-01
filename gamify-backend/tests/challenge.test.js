const { createChallenge,getAllChallengesIds } = require("../service/challengesService");

test("create challenge", async () => {
  const response = await createChallenge("poolevents", 20);
  expect(response.type).toBe("poolevents");
});

test("get challengeids", async () => {
  const response = await getAllChallengesIds();
  expect(response.length>0).toBe(true);
});

const { createBadge } = require("../service/badgeService");


test("create badge", async () => {
  const response = await createBadge(
    "informed",
    "onboarding information",
    "poolevents",
    "//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png"
  );
  expect(response.name).toBe("informed");
});

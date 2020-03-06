const { fetchCrewByUserId } = require("../service/crewService");

test("fetch crew by user id", async () => {
  const crew = await fetchCrewByUserId("4a74141e-c2c0-46a0-9c0c-84bef8be7d0f");
  expect(crew.name).toBe("Hamburg");
});

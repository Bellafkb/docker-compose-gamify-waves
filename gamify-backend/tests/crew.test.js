const { fetchCrewByUserId,createCrew,isNewCrew} = require("../service/crewService");
const {generateUuid} = require("../helper");
const CREWID = generateUuid()
const CITY = "CITY"

test("fetch crew by user id", async () => {
  const crew = await fetchCrewByUserId("8d411dc4-e76f-4d0e-a027-056a0bc43be5");
  expect(crew.name).toBe("San Francisco");
});


test("create crew", async () => {
  const crew = await createCrew(CREWID,CITY);
  expect(crew.name).toBe(CITY);
});

test("is new crew", async () => {
  const response = await isNewCrew(CREWID);
  expect(response).toBe(true);
});

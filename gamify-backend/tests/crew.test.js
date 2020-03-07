const { fetchCrewByUserId,createCrew,isNewCrew} = require("../service/crewService");
const {generateUuid} = require("../helper");
const mariadb = require("mariadb")
const CREWID = generateUuid()
const CITY = "CITY"


const connect = async () => {
  try {
    const pool = mariadb.createPool({
      host: "localhost",
      user: "root",
      password: "password",
      database: "gamifydb"
    });
    global.conn = await pool.getConnection();
  } catch (error) {
    throw error.message;
  }
}

test("fetch crew by user id", async () => {
  const crew = await fetchCrewByUserId("4a74141e-c2c0-46a0-9c0c-84bef8be7d0f");
  expect(crew.name).toBe("Hamburg");
});


test("create crew", async () => {
  await connect()
  const crew = await createCrew(CREWID,CITY);
  expect(crew.name).toBe(CITY);
});

test("is new crew", async () => {
  await connect()
  const response = await isNewCrew(CREWID);
  expect(response).toBe(true);
});

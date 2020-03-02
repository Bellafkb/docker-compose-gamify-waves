const { getSum } = require("../service/achievementService");
const mariadb = require("mariadb");

const pool = mariadb.createPool({
  host: "localhost",
  user: "root",
  password: "password",
  database: "gamify"
});

async function connect() {
  try {
    let conn;
    conn = await pool.getConnection();
    global.conn = conn;
    let a = await global.conn.query("SELECT * FROM scoop;");
  } catch (error) {
    throw error.message;
  }
}

test("adds 1 + 2 to equal 3", () => {
  connect();
  expect(getSum(1, 2)).toBe(3);
});

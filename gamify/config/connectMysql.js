const mariadb = require("mariadb");

const connectMysql = async () => {
  try {
    const pool = mariadb.createPool({
      host: "172.20.0.1",
      user: "root",
      database: "gamify",
      port: "3306",
      password:"password"
    });
    let conn = await pool.getConnection();
    global.conn = conn;
    console.log("mariadb db connected")
  } catch (error) {
    throw error;
  }
};

module.exports = { connectMysql };

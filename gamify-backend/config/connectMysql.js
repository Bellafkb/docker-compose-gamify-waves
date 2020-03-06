const mariadb = require("mariadb");

exports.connect = async () => {
  setTimeout(async () => {
    console.log("connecting to db...");
    try {
      const pool = await mariadb.createPool({
        host: "localhost", //172.17.0.1
        user: "root",
        database: "gamifydb",
        port: "3306",
        password: "password"
      });
      const conn = await pool.getConnection();
      global.conn = conn;
      console.log("mariadb db connected");
    } catch (error) {
      throw error;
    }
  }, 1000);
};

(async () => {
  await this.connect();
})();

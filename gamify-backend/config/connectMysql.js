const mariadb = require("mariadb");
exports.connectToDb = async () => {
  try {
    const conn = await mariadb.createConnection({
      host: "gamifydb", //172.17.0.1
      user: "root",
      database: "gamifydb",
      port: "3306",
      password: "password",
      connectionLimit: 1000
    });
    return conn;
  } catch (error) {
    throw error;
  }
};

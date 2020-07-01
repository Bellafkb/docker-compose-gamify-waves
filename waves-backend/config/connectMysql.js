const mysql = require("mysql");

exports.connect = async () => {
  try {
    const conn = await mysql.createPool({
      host: "172.17.0.1", //"172.17.0.1",
      user: "root",
      password: "password",
      database: "wavesdb",
      port: "3307",
      multipleStatements: true
    });
    console.log("connecting to db...");
    return conn;
  } catch (error) {
    throw error;
  }
};

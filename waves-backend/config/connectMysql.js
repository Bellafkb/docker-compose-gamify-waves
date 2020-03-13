const mysql = require("mysql");

(async () => {
  console.log("connecting to db...");
  try {
    const conn = await mysql.createConnection(
      {
        host: "172.17.0.1", //"172.17.0.1",
        user: "root",
        password: "password",
        database: "wavesdb",
        port: "3307"
      },
      { multipleStatements: true }
    );
    await conn.connect(err => {
      if (err) throw err;
      global.conn = conn;
    });
  } catch (error) {
    throw error;
  }
})();

exports.connect = async () => {
  console.log("connecting to db...");
  try {
    const conn = await mysql.createConnection(
      {
        host: "172.17.0.1", //"172.17.0.1",
        user: "root",
        password: "password",
        database: "wavesdb",
        port: "3307"
      },
      { multipleStatements: true }
    );
    await conn.connect(err => {
      if (err) throw err;
      global.conn = conn;
    });

    return conn;
  } catch (error) {
    throw error;
  }
};

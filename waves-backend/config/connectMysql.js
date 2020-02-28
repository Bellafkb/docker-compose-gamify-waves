const mariadb = require("mariadb");

const mysql = require("mysql");


(() => {
  setTimeout(async () => {
    console.log("connecting to db...");
    try {
      
      const conn = await mysql.createConnection(
        {
          host:  "localhost", //"172.17.0.1",
          user: "root",
          password: "password",
          database: "wavesdb",
          port:"3307"
        },
        { multipleStatements: true }
      );
      conn.connect(err => {
        if (err) throw err;
        console.log("db connected");
        global.conn = conn;
      });
    } catch (error) {
      throw error;
    }
  }, 15000);
})();


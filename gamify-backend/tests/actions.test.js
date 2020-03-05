const {
    createAction
  } = require("../service/actionsService");
  
  const mariadb = require("mariadb");
  
  const CREWID = "CREWTESTID";
  
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
  };
  
  
  /*test("createAction", async () => {
    await connect();
    const response = await createAction("CREATED_EVENT",50);
    expect(typeof response).toBe(typeof {});
    global.conn.end();
  });*/
  
  
  
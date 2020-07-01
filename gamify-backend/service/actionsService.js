const { getDateNow } = require("../helper");
const { connectToDb } = require("../config/connectMysql");


exports.createAction = async (name, points, type) => {
  try {
    const conn = await connectToDb();
    const timestamp = getDateNow();
    await conn.query(
      `INSERT INTO actions 
       SET created_at = ?, id_action=?, points =?, type=?;`,
      [timestamp, name, points, type]
    );
    conn.end()
    return {
      created_at: timestamp,
      id_action: name,
      points,
      type
    };
  } catch (error) {
    throw error;
  }
};

exports.getActionById = async action => {
  try {
    const conn = await connectToDb();
    const dbaction = await conn.query(
      "SELECT * FROM actions WHERE id_action=?",
      action
    );
    await conn.end()
    return dbaction;
  } catch (error) {
    throw error;
  }
};

exports.getActions = async () => {
  try {
    const conn = await connectToDb();
    const dbaction = await conn.query("SELECT * FROM actions");
    await conn.end()
    return dbaction;
  } catch (error) {
    throw error;
  }
};

exports.queryAcionsTypes = async ()=>{
  try {
    console.log("scoop");
    const conn = await connectToDb();
    const dbaction = await conn.query("SELECT a.type FROM actions a");
    await conn.end()
    return dbaction;
  } catch (error) {
    throw error
  }
}
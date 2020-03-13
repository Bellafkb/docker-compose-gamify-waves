const { getDateNow, generateUuid } = require("../helper");
const { connectToDb } = require("../config/connectMysql");

exports.saveActionHistory = async (crewId, userId, sourceId, category) => {
  try {
    const idhistory = generateUuid();
    const conn = await connectToDb();
    await conn.query("INSERT INTO action_history value (?,?,?,?,?,?)", [
      idhistory,
      category,
      getDateNow(),
      userId,
      crewId,
      sourceId
    ]);
    await conn.end()
    await conn.destroy()

    return {
      idhistory,
      category,
      created_at: getDateNow(),
      userId,
      crewId,
      sourceId
    };
  } catch (error) {
    throw error;
  }
};

exports.isDuplicate = async (crewId, sourceId, category) => {
  try {
    const conn = await connectToDb();
    const dbresponse = await conn.query(
      `SELECT * FROM action_history 
      where crew_id=? 
      AND source_id=? 
      AND category=?;`,
      [crewId, sourceId, category]
    );
    await conn.end()
    await conn.destroy()
    return dbresponse.length > 0;
  } catch (error) {
    throw error;
  }
};

const { getDateNow } = require("../helper");

exports.saveActionHistory = async (crewId, userId, sourceId, category) => {
  try {
    const dbresponse = await global.conn.query(
      "INSERT INTO action_history value (?,?,?,?,?)",
      [sourceId, category, getDateNow(), userId, crewId]
    );
    return dbresponse;
  } catch (error) {
    throw error;
  }
};

//takes crewId and
exports.isDuplicate = async (crewId, sourceId, category) => {
  try {
    const dbresponse = await global.conn.query(
      "SELECT * FROM action_history where crew_id=? AND idhistory=? AND category=?;",
      [crewId, sourceId, category]
    );
    return dbresponse.length>0;
  } catch (error) {
    throw error;
  }
};

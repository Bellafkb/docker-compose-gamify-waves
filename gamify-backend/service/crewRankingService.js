const { getDateNow, generateUuid } = require("../helper")

exports.getCrewLeaderboard = async () => {
  try {
    const leaderboard = await global.conn.query(
      "select * from crewLeaderboard"
    );
    return leaderboard;
  } catch (error) {
    throw error;
  }
};


exports.createLeaderboardEntry = async (crewId) => {
  try {
    const timestamp = getDateNow()
    const leaderboard = await global.conn.query(
      "INSERT INTO crew_leaderboard value (?,?,?,?,?)",
      [generateUuid(), crewId, 0, timestamp, timestamp]
    );
    return leaderboard;
  } catch (error) {
    throw error;
  }
};

exports.updateLeaderboardEntryByCrewId = async (crewId, score) => {
  try {
    const leaderboard = await global.conn.query(
      `UPDATE crew_leaderboard SET score=?, updated_at=? WHERE crew_id='${crewId}'`,
      [score, getDateNow()]
    );
    return leaderboard;
  } catch (error) {
    throw error;
  }
};

exports.handleAction = (action)=>{
  
}
const {} = require("../helper")

exports.getCrewRanking = async () => {
  try {
    const leaderboard = await global.conn.query(
      "select * from crewLeaderboard"
    );
    return leaderboard;
  } catch (error) {
    throw error;
  }
};

exports.createLeaderboardEntry = async () => {
  try {
    const leaderboard = await global.conn.query(
      "INSERT INTO crew_leaderboard value (?,?,?,?,?)",
      [generateUuid(), crewId, 0, getDateNow(), getDateNow()]
    );
    return leaderboard;
  } catch (error) {
    throw error;
  }
};
//test
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

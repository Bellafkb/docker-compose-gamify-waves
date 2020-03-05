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
      "insert into crewLeaderboard value (?,?,?,?,?)", []
    );
    return leaderboard;
  } catch (error) {
    throw error;
  }
};

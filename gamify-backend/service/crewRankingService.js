const {getDateNow,generateUuid} = require("../helper")

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
      "insert into crewLeaderboard value (?,?,?,?,?)", [,"1e",0,getDateNow(),getDateNow()]
    );
    return leaderboard;
  } catch (error) {
    throw error;
  }
};

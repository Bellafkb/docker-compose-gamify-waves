const { createLeaderboardEntry } = require("../service/crewRankingService");

exports.getUserProfileById = id => {};

exports.initUserProfile = async userId => {
  try {
    const entry = await createLeaderboardEntry(userId);
    return entry;
  } catch (error) {
    throw error;
  }
};

exports.isNewCrew = async userId => {
  try {
    const user = await global.conn.query(
      "select * from crew_leaderboard where crew_id=?",
      [userId]
    );
    return user.length > 0;
  } catch (error) {
    throw error;
  }
};

exports.getAllUsers = async () => {
  try {
    const users = await global.conn.query("select * from users;");
    return users;
  } catch (error) {
    throw error;
  }
};

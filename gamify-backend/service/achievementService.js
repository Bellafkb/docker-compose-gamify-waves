const { generateUuid, getDateNow } = require("../helper");

exports.fetchAchievements = async () => {
  try {
    const achievements = await global.conn.query(`select * from achievements;`);
    return achievements;
  } catch (error) {
    throw error;
  }
};

exports.createAchievement = async (name, desc) => {
  try {
    const dbresponse = await global.conn.query(
      "INSERT INTO achievements value (?,?,?,?,?,?)",
      [generateUuid(), name, "TESTUSER", 1, desc, getDateNow()]
    );
    return dbresponse;
  } catch (error) {
    throw error;
  }
};

exports.saveChallenge = id => {};

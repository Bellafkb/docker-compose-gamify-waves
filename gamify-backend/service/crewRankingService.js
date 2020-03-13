const { getDateNow, generateUuid } = require("../helper");
const { getActionById } = require("../service/actionsService");
const { handleAchievementProgress } = require("../service/progressService");
const {
  isDuplicate,
  saveActionHistory
} = require("../service/actionHistoryService");
const { connectToDb } = require("../config/connectMysql");

exports.getCrewLeaderboard = async () => {
  try {
    const conn = await connectToDb();
    const leaderboard = await conn.query(
      "select * from crew_leaderboard"
    );
    conn.end()
    conn.destroy()

    return leaderboard;
  } catch (error) {
    throw error;
  }
};

exports.createLeaderboardEntry = async crewId => {
  try {
    const conn = await connectToDb();
    const timestamp = getDateNow();
    const leaderboard = await conn.query(
      "INSERT INTO crew_leaderboard value (?,?,?,?,?)",
      [generateUuid(), crewId, 0, timestamp, timestamp]
    );
    conn.end()
    conn.destroy()

    return leaderboard;
  } catch (error) {
    throw error;
  }
};

exports.incrementLeaderBoardEntryByCrewId = async (crewId, score) => {
  try {
    const conn = await connectToDb();
    const leaderboard = await conn.query(
      `UPDATE crew_leaderboard SET score=score + ?, 
      updated_at=? WHERE crew_id='${crewId}'`,
      [score, getDateNow()]
    );
    conn.end()
    conn.destroy()

    return leaderboard;
  } catch (error) {
    throw error;
  }
};

exports.handleAction = async (category, userId, sourceId, crewId) => {
  try {
    const action = await getActionById(category);
    if (action.length > 0) {
      await handleAchievementProgress(userId, action[0].type);
      if (!(await isDuplicate(crewId, sourceId, category))) {
        await saveActionHistory(crewId, userId, sourceId, category);
        await this.incrementLeaderBoardEntryByCrewId(crewId, action[0].points);

        return true;
      } else {

        return false;
      }
    } else {

      return false;
    }
  } catch (error) {
    throw error;
  }
};

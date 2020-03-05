const { getDateNow, generateUuid } = require("../helper")
const { getActionById } = require("../service/actionsService")


exports.getCrewLeaderboard = async () => {
  try {
    const leaderboard = await global.conn.query(
      "select * from crew_leaderboard"
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

exports.incrementLeaderBoardEntryByCrewId = async (crewId, score) => {
  try {
    const leaderboard = await global.conn.query(
      `UPDATE crew_leaderboard SET score=score + ?, updated_at=? WHERE crew_id='${crewId}'`,
      [score, getDateNow()]
    );
    return leaderboard;
  } catch (error) {
    throw error;
  }
};

exports.handleAction = async (actionId, crewId) => {
  try {
    const action = await getActionById(actionId);
    if (action.length) {
      await this.incrementLeaderBoardEntryByCrewId(crewId, action[0].points)
      return action;
    } else {
      return
    }
  } catch (error) {
    throw error;
  }
}
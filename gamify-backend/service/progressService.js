const { generateUuid, getDateNow } = require("../helper");

exports.createChallengeProgress = async (userId, challenge_id) => {
  try {
    const uuid = generateUuid();
    const timestamp = getDateNow();
    const score = 0;
    await global.conn.query(
      "insert into challenge_progress value (?,?,?,?,?,?)",
      [userId, challenge_id, score, timestamp, timestamp, uuid]
    );
    return {
      idcp: uuid,
      challenge_id: challenge_id,
      score,
      created_at: timestamp,
      updated_at: timestamp
    };
  } catch (error) {
    throw error;
  }
};

exports.incrementScorebyUserId = async (userId, type, score) => {
  try {
    await global.conn.query(
      `UPDATE gamifydb.challenge_progress cp 
      INNER JOIN gamifydb.challenges c 
      ON cp.challenge_id=c.idchallenge 
      SET cp.score=score+? WHERE cp.user_id=? AND c.type=?`,
      [score, userId, type]
    );
    return {
      userId,
      type
    };
  } catch (error) {
    throw error;
  }
};

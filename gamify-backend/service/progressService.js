const { generateUuid, getDateNow } = require("../helper");
const { getActionById } = require("../service/actionsService");

exports.createChallengeProgress = async (userId, challenge_id) => {
  try {
    const uuid = generateUuid();
    const timestamp = getDateNow();
    const score = 0;
    await global.conn.query(
      "insert into challenge_progress value (?,?,?,?,?,?,?)",
      [userId, challenge_id, score, timestamp, timestamp, uuid, 0]
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

exports.incrementScorebyUserId = async (userId, type) => {
  try {
    await global.conn.query(
      `UPDATE challenge_progress cp 
      INNER JOIN challenges c 
      ON cp.challenge_id=c.idchallenge 
      SET cp.score=cp.score+1 WHERE cp.user_id=? 
      AND c.type=? AND cp.completed=0`,
      [userId, type]
    );
    return true;
  } catch (error) {
    throw error;
  }
};

exports.getCompletedChallenges = async userId => {
  try {
    const idcps = await global.conn.query(
      `SELECT cp.idcp FROM challenges c 
      join challenge_progress cp 
      on cp.challenge_id =c.idchallenge 
      AND cp.score=c.points 
      WHERE cp.user_id =? and cp.completed=0;`,
      [userId]
    );
    return idcps;
  } catch (error) {
    throw error;
  }
};

exports.setCompletedChallenges = async progressIds => {
  try {
    await progressIds.map(async ({ idcp }) => {
      await global.conn.query(
        `update challenge_progress set completed=1 where idcp=?`,
        [idcp]
      );
    });

    return true;
  } catch (error) {
    throw error;
  }
};

exports.handleAchievementProgress = async (userId, type) => {
  try {
    await this.incrementScorebyUserId(userId, type);
    const progressIds = await this.getCompletedChallenges(userId);
    await this.setCompletedChallenges(progressIds);
    return true;
  } catch (error) {
    throw error;
  }
};

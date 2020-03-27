const { generateUuid, getDateNow } = require("../helper");
const { getActionById } = require("../service/actionsService");
const { connectToDb } = require("../config/connectMysql");


exports.createChallengeProgress = async (userId, challenge_id) => {
  try {
    const conn = await connectToDb()
    const uuid = generateUuid();
    const timestamp = getDateNow();
    const score = 0;

    await conn.query(
      "insert into challenge_progress value (?,?,?,?,?,?,?)",
      [userId, challenge_id, score, timestamp, timestamp, uuid, 0]
    );
    conn.end()
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
    const conn = await connectToDb()
    await conn.query(
      `UPDATE challenge_progress cp 
      INNER JOIN challenges c 
      ON cp.challenge_id=c.idchallenge 
      SET cp.score=cp.score+1 WHERE cp.user_id=? 
      AND c.type=? AND cp.completed=0`,
      [userId, type]
    );
    conn.end()
    return true;
  } catch (error) {
    throw error;
  }
};

exports.getCompletedChallenges = async userId => {
  try {
    const conn = await connectToDb()

    const idcps = await conn.query(
      `SELECT cp.idcp FROM challenges c 
      join challenge_progress cp 
      on cp.challenge_id =c.idchallenge 
      AND cp.score=c.points 
      WHERE cp.user_id =? and cp.completed=0;`,
      [userId]
    );
    conn.end()
    return idcps;
  } catch (error) {
    throw error;
  }
};

exports.setCompletedChallenges = async progressIds => {
  try {
    const conn = await connectToDb()
    await progressIds.map(async ({ idcp }) => {
      await conn.query(
        `update challenge_progress set completed=1 where idcp=?`,
        [idcp]
      );
    });
    conn.end()

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

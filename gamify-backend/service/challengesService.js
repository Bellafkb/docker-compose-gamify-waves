const { generateUuid, getDateNow } = require("../helper");
const { connectToDb } = require("../config/connectMysql");

exports.createChallenges = async challenges => {
  try {
    const conn = await connectToDb();

    const now = getDateNow();
    const challenges_resp = await Promise.all(
      challenges.map(async ({ type, points }) => {
        let uuid = generateUuid();
        await conn.query("insert into challenges value (?,?,?,?,?)", [
          uuid,
          now,
          type,
          points,
          now
        ]);
        return {
          idchallenge:uuid,
          now,
          type,
          points,
          now
        } 
      })
    );
    conn.end();
    return challenges_resp
  } catch (error) {
    throw error;
  }
};

exports.getAllChallengesIds = async () => {
  try {
    const conn = await connectToDb();
    const challengeIds = await conn.query(
      "SELECT c.idchallenge FROM challenges AS c;"
    );
    conn.end();
    conn.destroy();

    return challengeIds;
  } catch (error) {
    throw error;
  }
};

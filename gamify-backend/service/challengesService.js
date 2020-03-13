const { generateUuid, getDateNow } = require("../helper");
const { connectToDb } = require("../config/connectMysql");

exports.createChallenge = async (type, points) => {
  try {
    const conn = await connectToDb();

    const uuid = generateUuid();
    const now = getDateNow();
    await conn.query("insert into challenges value (?,?,?,?,?)", [
      uuid,
      now,
      type,
      points,
      now
    ]);
    conn.end()
    conn.destroy()


    return {
      idchallenge: uuid,
      type,
      points
    };
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
    conn.end()
    conn.destroy()

    return challengeIds;
  } catch (error) {
    throw error;
  }
};

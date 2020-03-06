const { generateUuid, getDateNow } = require("../helper");
exports.createChallenge = async (type, points) => {
  try {
    const uuid = generateUuid();
    const now = getDateNow();
    await global.conn.query("insert into challenges value (?,?,?,?,?)", [
      uuid,
      now,
      type,
      points,
      now
    ]);
    return {
      idchallenge: uuid,
      type,
      points
    };
  } catch (error) {
    throw error;
  }
};

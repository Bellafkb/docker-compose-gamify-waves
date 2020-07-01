const { getDateNow, generateUuid } = require("../helper");
const { connectToDb } = require("../config/connectMysql");

exports.createBadge = async (name, desc, img_url) => {
  try {
    const conn = await connectToDb();
    const uuid = generateUuid();
    const now = getDateNow();
    await conn.query("insert into badges value (?,?,?,?,?,?)", [
      uuid,
      name,
      desc,
      now,
      now,
      img_url
    ]);
    conn.end()
    return {
      idbadge: uuid,
      name,
      desc,
      img_url
    };
  } catch (error) {
    throw error;
  }
};

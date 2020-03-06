const { getDateNow, generateUuid } = require("../helper");

exports.createBadge = async (name, desc, type, img_url) => {
  try {
    const uuid = generateUuid();
    const now = getDateNow();
    await global.conn.query("insert into badges value (?,?,?,?,?,?,?)", [
      uuid,
      name,
      desc,
      type,
      now,
      now,
      img_url
    ]);
    return {
      idbadge: uuid,
      name,
      desc,
      type,
      img_url
    };
  } catch (error) {
    throw error;
  }
};

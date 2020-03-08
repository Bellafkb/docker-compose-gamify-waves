const { getDateNow } = require("../helper");

exports.createAction = async (name, points, type) => {
  try {
    const timestamp = getDateNow();
    await global.conn.query(
      `INSERT INTO actions 
       SET created_at = ?, id_action=?, points =?, type=?;`,
      [timestamp, name, points, type]
    );
    return {
      created_at: timestamp,
      id_action: name,
      points,
      type
    };
  } catch (error) {
    throw error;
  }
};

exports.getActionById = async action => {
  try {
    const dbaction = await global.conn.query(
      "SELECT * FROM actions WHERE id_action=?",
      action
    );
    return dbaction;
  } catch (error) {
    throw error;
  }
};

exports.getActions = async () => {
  try {
    const dbaction = await global.conn.query("SELECT * FROM actions");
    return dbaction;
  } catch (error) {
    throw error;
  }
};

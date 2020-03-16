const { connect } = require("../config/connectMysql");

exports.countEntriesByTableName = async (tableName, userId, callback) => {
  const conn = await connect();
  let sql = `SELECT COUNT(*) AS count FROM ${tableName}
  WHERE user_id=?`;
  conn.query(sql, userId, (error, count) => {
    if (error) {
      conn.end();
      return callback(error);
    }
    conn.end();
    return callback(null, count);
  });
};

exports.getEntriesByTableName = async (tableName, userId, callback) => {
  const conn = await connect();
  let sql = `SELECT COUNT(*) AS count 
  FROM ${tableName} 
  where state="RELEASED"`;
  conn.query(sql, userId, (error, count) => {
    if (error) {
      conn.end();
      return callback(error);
    }
    conn.end();
    return callback(null, count);
  });
};

exports.joinNotificationOnTablename = async (tableName, userId, callback) => {
  const conn = await connect();
  let sql = `SELECT COUNT(*) AS count FROM ${tableName}
  WHERE user_id=?`;
  conn.query(sql, userId, (error, count) => {
    if (error) {
      conn.end();
      callback(error);
    }
    conn.end();

    callback(null, count);
  });
};

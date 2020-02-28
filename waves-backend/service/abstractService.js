exports.countEntriesByTableName = (tableName, userId, callback) => {
  let sql = `SELECT COUNT(*) AS count FROM ${tableName}
  WHERE user_id=?`;
  global.conn.query(sql, userId, (error, count) => {
    if (error) {
      return callback(error);
    }
    return callback(null, count);
  });
};

exports.getEntriesByTableName = (tableName, userId, callback) => {
  let sql = `SELECT COUNT(*) AS count FROM ${tableName} where state="RELEASED"`;
  global.conn.query(sql, userId, (error, count) => {
    if (error) {
      return callback(error);
    }
    return callback(null, count);
  });
};

exports.joinNotificationOnTablename = (tableName, userId, callback) => {
  let sql = `SELECT COUNT(*) AS count FROM ${tableName}
  WHERE user_id=?`;
  global.conn.query(sql, userId, (error, count) => {
    if (error) {
      callback(error);
    }
    callback(null, count);
  });
};

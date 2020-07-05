const { generateUuid } = require("../helper");
const { connect } = require("../config/connectMysql");

exports.getNumOfPeByUserId = (userId, callback) => {
  try {
    global.conn.query(
      "SELECT COUNT(*) as count FROM poolevents p WHERE user_id= ?;",
      userId,
      (error, numPoolevents) => {
        if (!error) {
          callback(null, numPoolevents);
        } else {
          callback(error);
        }
      }
    );
  } catch (error) {
    callback(error);
  }
};

exports.savePoolevent = async (
  frontData,
  callback
) => {
  const conn = await connect();
  const idevent = generateUuid();
  frontData.idevent = idevent;
  console.log("savePoolevent:",frontData);
  try {
    const sql = "INSERT INTO poolevents SET ?;";
    conn.query(sql, frontData, (error, resp) => {
      if (!error) {
        conn.end();
        callback(null, frontData);
      } else {
        console.log(error);
        conn.end();
        callback(error);
      }
    });
  } catch (error) {
    conn.end();
    callback(error);
  }
};

exports.incrementFaveCount = async (id, callback) => {
  try {
    const conn = await connect()
    const sql = "UPDATE poolevents SET fave_count=fave_count+1 WHERE idevent=?;";
    conn.query(sql, id, (error, resp) => {
      conn.end()
      if (!error) {
        callback(null, resp);
      } else {
        callback(error);
      }
    });
  } catch (error) {
    callback(error);
  }
};

exports.getPooleventById = (id, callback) => {
  const sql = "SELECT * from poolevents WHERE id=?;";
  global.conn.query(sql, id, (error, poolevent) => {
    if (!error) {
      callback(null, poolevent);
    } else {
      callback(error);
    }
  });
};

const { connect } = require("../config/connectMysql");
const {
  ACTIONS,
  REDIS_CHANNELS,
  generateUuid,
  getDateNow
} = require("../helper");
const { publish } = require("../service/publisherService");

exports.getApplicationById = (id, callback) => {
  const sql = "SELECT * FROM applications where id=?";
  global.conn.query(sql, id, (error, rows) => {
    if (!error) {
      console.log(rows);
      callback(null, rows);
    } else {
      callback(error);
    }
  });
};

exports.saveApplication = async (text, userId, pId) => {
  const conn = await connect();
  const timestamp = getDateNow();
  const idapplication = generateUuid();
  const application = {
    idapplication,
    text,
    user_id: userId,
    poolevent_id: pId,
    created_at: timestamp,
    updated_at: timestamp
  };
  const sql = "insert into applications set ?";

  conn.query(sql, application, (error, rows) => {
    if (!error) {
      publish(REDIS_CHANNELS.WAVES, ACTIONS.APPLICATION, userId, idapplication);
      return application;
    } else {
      throw error;
    }
  });
};

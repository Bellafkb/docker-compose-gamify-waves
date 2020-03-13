const { generateUuid } = require("../helper");
const { connect } = require("../config/connectMysql");
const { publish } = require("../service/publisherService");

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
  name,
  event_start,
  event_end,
  application_start,
  application_end,
  asp_event_id,
  website,
  supporter_lim,
  active_user_only,
  user_id,
  crew_id,
  idevent_type,
  callback
) => {
  const conn = await connect();
  const idevent = generateUuid();
  const event = {
    idevent,
    name,
    event_start,
    event_end,
    application_start,
    application_end,
    asp_event_id,
    website,
    supporter_lim,
    active_user_only,
    user_id,
    crew_id,
    idevent_type,
    crew_id
  };
  try {
    const sql = "INSERT INTO poolevents SET ?;";
    conn.query(sql, event, (error, resp) => {
      if (!error) {
        conn.end();
        publish("WAVES", "EVENT_CREATED", user_id, idevent);
        callback(null, event);
      } else {
        callback(error);
      }
    });
  } catch (error) {
    callback(error);
  }
};

exports.incrementFaveCount = (id, callback) => {
  try {
    const sql = "UPDATE poolevents SET fave_count=fave_count+1 WHERE id=?;";
    global.conn.query(sql, id, (error, resp) => {
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

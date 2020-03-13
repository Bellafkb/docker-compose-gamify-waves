const { connect } = require("../config/connectMysql");
const {
  generateUuid,
  getDateNow,
  ACTIONS,
  REDIS_CHANNELS
} = require("../helper");
const { publish } = require("../service/publisherService");

exports.saveComment = async (text, userId, pId) => {
  try {
    const conn = await connect();
    const idcomment= generateUuid()
    const timestamp = getDateNow();
    const comment = {
      idcomment,
      text,
      user_id: userId,
      poolevent_id: pId,
      created_at: timestamp,
      edited_at: timestamp
    };

    conn.query("insert into comments set ?", comment, (error, resp) => {
      if (error) {
        throw error;
      }
      publish(REDIS_CHANNELS.WAVES, ACTIONS.COMMENT, userId, idcomment);
      conn.end();
      return comment;
    });
  } catch (error) {
    throw error;
  }
};

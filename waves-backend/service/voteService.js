const { connect } = require("../config/connectMysql");
const { publish } = require("../service/publisherService");
const { generateUuid, REDIS_CHANNELS, ACTIONS } = require("../helper");

exports.saveVote = async (userId, commentId, callback) => {
  try {
    const id = generateUuid();
    const vote = {
      id,
      user_id: userId,
      comment_id: commentId
    };
    const conn = await connect();
    conn.query(`INSERT INTO votes SET ?`, vote, async (error, v) => {
      if (error) {
        conn.end(error => {
          return callback(error);
        });
      }
      await publish(REDIS_CHANNELS.WAVES, ACTIONS.VOTE, userId, id);
      conn.end(() => {
        return callback(null, vote);
      });
    });
  } catch (error) {
    throw error;
  }
};

exports.deleteVote = async (id, callback) => {
  try {
    const conn = await connect();
    conn.query(`DELETE FROM votes v WHERE v.id=?`, id, (error, resp) => {
      if (error) {
        return callback(error);
      } else {
        return callback(null, id);
      }
    });
  } catch (error) {
    callback(error);
  }
};

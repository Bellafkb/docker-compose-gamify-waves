const { connect } = require("../config/connectMysql");
const { saveComment } = require("../service/commentService");
const { publish } = require("../service/publisherService");
const { ACTIONS, REDIS_CHANNELS } = require("../helper");

// @desc get comment by id
// @route GET /api/v1/comment/:id
// @access Public
exports.getCommentsByPooleventId = async (req, res, next) => {
  const { id } = req.params;

  const sql = `SELECT c.idcomment, 
              c.text, 
              c.user_id,
              c.poolevent_id, 
              c.created_at 
              FROM comments c 
              JOIN users u ON c.user_id=u.id
              WHERE c.poolevent_id='${id}' 
              order by c.created_at desc;`;
  req.conn.query(sql, async (err, comments) => {
    if (err) {
      req.error = err;
    } else {
      resolveVotes(comments, (err, result) => {
        if (err) {
          req.error = err;
        }
        req.data = result;
        next();
      });
    }
  });
};

const resolveVotes = async (comments, callback) => {
  try {
    const conn = await connect();
    comments.map((comment, i) => {
      conn.query(
        "select * from votes where comment_id=?",
        comment.idcomment,
        (error, votes) => {
          if (error) {
            callback(error);
          }
          comment.votes = votes || [];
          if (comments.length - 1 == i) {
            conn.end();
            callback(null, comments);
          }
        }
      );
    });
  } catch (error) {
    callback(error);
  }
};

// @desc  create comment
// @route POST /api/v1/comment
// @access Private
exports.postComment = async (req, res) => {
  try {
    const { body } = req;
    const { userId } = req.user;
    body.user_id = userId;
    await saveComment(body.text, body.user_id, body.pId);
    res.status(200).json({ success: true });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};

// @desc delete comment by id
// @route DELETE /api/v1/comment/:id
// @access Private
exports.deleteComment = async (req, res, next) => {
  const { id } = req.user;
  req.conn.query(`DELETE FROM WHERE comments.id='${id}';`, (error, resp) => {
    if (error) {
      req.error = error;
      next();
    } else {
      req.data = resp;
      next();
    }
  });
};

// @desc edit comment by id
// @route PUT /api/v1/comment/:id
// @access Private
exports.putComment = (req, res) => {
  const { body } = req;
  const { id } = req.user;
  body.user_id = id;

  global.conn.query(
    `UPDATE comments SET ? WHERE id =${id};`,
    body,
    (error, resp) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in putcomment: ${error.message}`
        });
      } else {
        res.status(200).json({
          success: true,
          data: resp
        });
      }
    }
  );
};

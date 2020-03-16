const { connect } = require("../config/connectMysql");
const { saveComment } = require("../service/commentService");
const { publish } = require("../service/publisherService");
const { ACTIONS, REDIS_CHANNELS } = require("../helper");

// @desc get comment by id
// @route GET /api/v1/comment/:id
// @access Public
exports.getCommentsByPooleventId = async (req, res, next) => {
  const conn = await connect();
  req.conn = conn;
  const { id } = req.params;

  const sql = `SELECT c.text, c.idcomment, c.created_at, 
              c.user_id,u.full_name, u.first_name,u.last_name 
              FROM comments c 
              JOIN users u ON c.user_id=u.id  
              WHERE c.poolevent_id='${id}' 
              order by c.created_at desc;`;
  conn.query(sql, (err, comment) => {
    if (err) {
      req.error = err;
      next();
    } else {
      req.data = comment;
      next();
    }
  });
};

// @desc  create comment
// @route POST /api/v1/comment
// @access Private
exports.postComment = async (req, res) => {
  try {
    const { body } = req;
    const { id } = req.user;
    body.user_id = id;
    const comment = await saveComment(body.text, body.userId, body.pId);
    publish(REDIS_CHANNELS.WAVES, ACTIONS.COMMENT, id, comment.idcomment);
    res.status(200).json({ success: true, data: comment });
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

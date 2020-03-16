const { saveVote } = require("../service/voteService");
// @desc get vote by id
// @route GET /api/v1/vote/:id
// @access Public
exports.getvoteByCommentId = (req, res,next) => {
  const { comment_id } = req.params;
  req.conn.query(
    `SELECT * FROM votes p WHERE p.comment_id='${comment_id}'`,
    (err, votes) => {
      if (err) {
        req.error= err
        next()
      } else {
        req.data = votes
        next()
      }
    }
  );
};

// @desc  create vote
// @route POST /api/v1/vote
// @access Private
exports.postvote = (req, res) => {
  const { comment_id } = req.body;
  const { id } = req.user;
  const user_id = id;

  saveVote(user_id, comment_id, (error, vote) => {
    if (error) {
      res.status(400).json({ success: false, messaage: error.message });
    }
    res.json({ success: true, vote });
  });
};

// @desc delete vote by id
// @route DELETE /api/v1/vote/:id
// @access Private
exports.deletevote = (req, res) => {
  const { id } = req.params;

  global.conn.query(
    `DELETE FROM votes WHERE votes.id='${id}'`,
    (error, resp) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in deletevote ${error.message}`
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

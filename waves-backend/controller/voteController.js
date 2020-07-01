const { saveVote } = require("../service/voteService");

// @desc  create vote
// @route POST /api/v1/vote
// @access Private
exports.postvote = (req, res,next) => {
  const { comment_id } = req.body;
  const { userId } = req.user;
  saveVote(userId, comment_id, (error, vote) => {
    if (error) {
      req.error=error  
      next()
    }
    req.data= vote
    next()
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

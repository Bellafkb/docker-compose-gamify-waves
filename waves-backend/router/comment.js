const router = require("express").Router();
const { verify } = require("../middleware/tokenChecker");
const { handleResponse } = require("../middleware/handleResponse");
const { iniDbConnection } = require("../middleware/initDbConnection");

const {
  deleteComment,
  getCommentsByPooleventId,
  postComment,
  putComment
} = require("../controller/commentController");

router.route("/").post(
  verify,
  postComment,
); //private

router
  .route("/poolevent/:id")
  .get(iniDbConnection, getCommentsByPooleventId, handleResponse);

router
  .route("/:id")
  .put(verify, putComment) //private
  .delete(verify, deleteComment); //private

module.exports = router;

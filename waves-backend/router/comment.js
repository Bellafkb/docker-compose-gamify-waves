const router = require("express").Router();
const { verify } = require("../middleware/tokenChecker");
const { checkAccessControl } = require("../middleware/accessControlChecker");
const { check } = require("express-validator");
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
  checkAccessControl("createOwn", "comment"),
  check("text")
    .not()
    .isEmpty()
    .isString(),
  iniDbConnection,
  postComment,
  handleResponse
); //private

router
  .route("/poolevent/:id")
  .get(iniDbConnection, getCommentsByPooleventId, handleResponse);

router
  .route("/:id")
  .put(verify, putComment) //private
  .delete(verify, deleteComment); //private

module.exports = router;

const router = require("express").Router();
const { check } = require("express-validator");
const { iniDbConnection } = require("../middleware/initDbConnection");
const { handleResponse } = require("../middleware/handleResponse");

const {
  deletevote,
  getvoteByCommentId,
  postvote
} = require("../controller/voteController");

const { verify } = require("../middleware/tokenChecker");

router
  .route("/:comment_id")
  .get(iniDbConnection, getvoteByCommentId, handleResponse);

router.route("/").post(
  verify,
  check("comment_id")
    .not()
    .isEmpty()
    .isNumeric(),
  iniDbConnection,
  postvote,
  handleResponse
); //private

router
  .route("/:id")
  .delete(verify, iniDbConnection, deletevote, handleResponse); //private

module.exports = router;

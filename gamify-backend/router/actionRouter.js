const router = require("express").Router();
const { check } = require("express-validator");
const {
  getAcions,
  postActions,
} = require("../controller/actionController");



router
  .route("/")
  .get(getAcions)
  .post(
    [
      check("name")
        .notEmpty()
        .isString(),
      check("points")
        .notEmpty()
        .isNumeric(),
      check("type")
        .notEmpty()
        .isString()
    ],
    postActions
  );


module.exports = router;

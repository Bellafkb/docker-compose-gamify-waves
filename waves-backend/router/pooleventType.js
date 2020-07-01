const router = require("express").Router();
const { verify } = require("../middleware/tokenChecker");
const { checkAccessControl } = require("../middleware/accessControlChecker");
const { iniDbConnection } = require("../middleware/initDbConnection");
const { handleResponse } = require("../middleware/handleResponse");
const { postPeType,getAllPeType } = require("../controller/pooleventTypeController");


const { check } = require("express-validator");



router
  .route("/")
  .get(iniDbConnection, getAllPeType, handleResponse)
  .post(
    verify,
    checkAccessControl("createAny", "event_type"),
    check("name")
      .not()
      .isEmpty()
      .isString(),
    postPeType
  );


module.exports = router;

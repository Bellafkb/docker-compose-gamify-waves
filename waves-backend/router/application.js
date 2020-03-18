const router = require("express").Router();
const { verify, verifyX } = require("../middleware/tokenChecker");
const { handleResponse } = require("../middleware/handleResponse");
const { iniDbConnection } = require("../middleware/initDbConnection");

const {
  pooleventAccessControl,
  applicationAccessControl
} = require("../middleware/accessControlChecker");
const { check } = require("express-validator");

const {
  deleteApplication,
  getApplicationsEvent,
  getApplicationsUser,
  postApplication,
  putApplication
} = require("../controller/applicationController");

router.route("/").post(
  verify,
  [
    check("text").isString(),
    check("poolevent_id")
      .not()
      .isEmpty()
      .isNumeric()
  ],
  iniDbConnection,
  postApplication,
  handleResponse
);

router
  .route("/:id")
  .put(
    verify,
    applicationAccessControl,
    iniDbConnection,
    putApplication,
    handleResponse
  )
  .delete(verify, iniDbConnection, deleteApplication, handleResponse);

router
  .route("/poolevent/:id")
  .get(
    verify,
    pooleventAccessControl,
    iniDbConnection,
    getApplicationsEvent,
    handleResponse
  );

router
  .route("/user")
  .get(verify, iniDbConnection, getApplicationsUser, handleResponse);

module.exports = router;

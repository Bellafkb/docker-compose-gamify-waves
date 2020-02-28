const router = require("express").Router();
const { verify, verifyX } = require("../middleware/tokenChecker");
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
  putApplication,
  getApplicationStatisticByUserId
} = require("../controller/applicationController");

router.route("/").post(
  verifyX,
  [
    check("text").isString(),
    check("poolevent_id")
      .not()
      .isEmpty()
      .isNumeric()
  ],
  postApplication
);

router
  .route("/:id")
  .put(verifyX, applicationAccessControl, putApplication)
  .delete(verify, deleteApplication);

router
  .route("/poolevent/:id")
  .get(verifyX, pooleventAccessControl, getApplicationsEvent);

router.route("/user").get(verify, getApplicationsUser);

module.exports = router;

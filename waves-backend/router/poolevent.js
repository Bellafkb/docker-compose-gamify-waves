const router = require("express").Router();
const { check } = require("express-validator");
const { verify, verifyX } = require("../middleware/tokenChecker");
const { handleResponse } = require("../middleware/handleResponse");
const { iniDbConnection } = require("../middleware/initDbConnection");

const {
  checkAccessControl,
  pooleventAccessControl
} = require("../middleware/accessControlChecker");

const {
  getPoolEventByUserId,
  deletePoolEvent,
  getPoolEventById,
  getPoolEvents,
  postPoolEvent,
  putPoolEvent
} = require("../controller/pooleventController");

router
  .route("/")
  .get(iniDbConnection, getPoolEvents, handleResponse)
  .post(
    //verifyX,
    //pooleventAccessControl,
    [
      check("front.name")
        .not()
        .isEmpty()
        .isString(),
      check("front.idevent_type")
        .not()
        .isEmpty()
        .isNumeric(),
      check("front.active_user_only").isBoolean(),
      check("front.website").isURL(),
      check("front.supporter_lim").isNumeric(),
      check("front.application_start").isNumeric(),
      check("front.application_end").isNumeric(),
      check("front.event_start").isNumeric(),
      check("front.event_end").isNumeric(),
      check("location.route").isString(),
      check("location.street_number")
        .not()
        .isEmpty()
        .isString(),
      check("location.longitude")
        .not()
        .isEmpty()
        .isString(),
      check("location.latitude")
        .not()
        .isEmpty()
        .isString(),
      check("location.locality")
        .not()
        .isEmpty()
        .isString(),
      check("location.postal_code")
        .not()
        .isEmpty()
        .isString(),
      check("location.desc").isString(),
      check("description.text").isString(),
      check("description.html").isString()
    ],
    postPoolEvent,
    handleResponse
  );

router
  .route("/:id")
  .get(iniDbConnection, getPoolEventById, handleResponse)
  .put(verifyX, pooleventAccessControl, putPoolEvent, handleResponse)
  .delete(
    verify,
    checkAccessControl("updateAny", "poolevent"),
    deletePoolEvent,
    handleResponse
  );

router.route("/user/me").get(verifyX, getPoolEventByUserId); //private

module.exports = router;

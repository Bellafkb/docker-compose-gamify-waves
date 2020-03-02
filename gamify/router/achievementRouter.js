const router = require("express").Router();
const { check } = require("express-validator");

const {
  postAchievement,
  getAchievements
} = require("../controller/achievementController");

router
  .route("/")
  .get(getAchievements)
  .post(
    [
      check("name")
        .notEmpty()
        .isString(),
      check("desc")
        .notEmpty()
        .isString()
    ],
    postAchievement
  );

module.exports = router;

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
      check("badge.name")
        .notEmpty()
        .isString(),
      check("badge.desc")
        .notEmpty()
        .isString(),
        check("badge.img_url")
        .notEmpty()
        .isString(),
        check("challenge.points")
        .notEmpty()
        .isString(),
        check("challenge.type")
        .notEmpty()
        .isString(),
    ],
    postAchievement
  );


module.exports = router;

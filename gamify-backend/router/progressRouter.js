const router = require("express").Router();
const { check } = require("express-validator");
const {
    getMyAchievementProgress
} = require("../controller/progressController");

router.route("/:userId").get(getMyAchievementProgress);

module.exports = router;

const router = require("express").Router();

const {
    getTrophiesByUserId
} = require("../controller/trophiesController");

router.route("/:userId").get(getTrophiesByUserId);

module.exports = router;

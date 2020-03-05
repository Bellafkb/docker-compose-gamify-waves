const router = require("express").Router()
const { getRankedLeaderboard } = require("../controller/crewRankingController")


router.get("/",getRankedLeaderboard)

module.exports = router

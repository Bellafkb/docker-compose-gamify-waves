const route = require("express").Router();
const crewRanking = require("./crewRankingRouter");
const achievementRouter = require("./achievementRouter");
const actionsRouter = require("./actionRouter");
const progressRouter = require("./progressRouter");
const trophiesRouter = require("./trophiesRouter"); 




route.get("/", async (req, res) => {
  res.json({
    success: true,
    message: "i'm alive!"
  });
});

route.get("/scoop", (req, res) => {
  try {
    global.redis_client.get(1, (error, data) => {
      res.json({ data: JSON.parse(data) });
    });
  } catch (error) {
    console.log(error);
  }
});

module.exports = {
  route,
  crewRanking,
  achievementRouter,
  actionsRouter,
  progressRouter,
  trophiesRouter
};

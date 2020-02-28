const route = require("express").Router();
const crewRanking = require("./crewRankingRouter");

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
  crewRanking
};

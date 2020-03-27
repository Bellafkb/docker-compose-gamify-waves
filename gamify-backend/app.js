require("./config/connectMysql");
require("./config/connectRedis");
require("./config/redisSubscriptions");
require("./service/intervalTrophieService");
const cookieParser = require("cookie-parser");
const bodyParser = require("body-parser");
const morgan = require("morgan")("dev");
const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
const {
  achievementRouter,
  route,
  crewRanking,
  actionsRouter,
  progressRouter
} = require("./router");

require("colors");

dotenv.config({ path: "./config/.env" });

const app = express();
var server = require("http").Server(app);

app.use(morgan);

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cookieParser());
app.use(cors());

const base = "/backend/gamify";
app.use(base, route);
app.use(base + "/achievement", achievementRouter);
app.use(base + "/leaderboard", crewRanking);
app.use(base + "/action", actionsRouter);
app.use(base + "/progress", progressRouter);

app.use((req, res, callback) => {
  const error = new Error("not found");
  error.status = 404;
  callback(error);
});

app.use((error, req, res, callback) => {
  res
    .status(error.status || 500)
    .json({ success: false, message: error.message });
});

const port = process.env.PORT || 3000;

server.listen(port, () => {
  console.log(`App running in ${port} mode on port ${port}`.rainbow);
});

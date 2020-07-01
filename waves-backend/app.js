require("./config/connectMysql");
require("./config/connectRedis");
const cookieParser = require("cookie-parser");
const bodyParser = require("body-parser");
const morgan = require("morgan")("dev");
const express = require("express");
const route = require("./router");
const dotenv = require("dotenv");
const cors = require("cors");

const poolevent = require("./router/poolevent");
const application = require("./router/application");
const comment = require("./router/comment");
const vote = require("./router/vote");
const notification = require("./router/notification");
const eventtype = require("./router/pooleventType");
const favorite = require("./router/favorite");
const user = require("./router/user");

require("colors");

dotenv.config({ path: "./config/.env" });

const app = express();
var server = require("http").Server(app);

app.use(morgan);

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cookieParser());
app.use(cors());
const base = "/backend/waves/api/v1";
app.use(base, route);
app.use(base + "/poolevent", poolevent);
app.use(base + "/application", application);
app.use(base + "/vote", vote);
app.use(base + "/comment", comment);
app.use(base + "/notification", notification);
app.use(base + "/favorite", favorite);
app.use(base + "/user", user);
app.use(base + "/eventtype", eventtype);

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

const port = 4000;

server.listen(port, () => {
  console.log(`App running in ${port} mode on port ${port}`.green.bold);
});

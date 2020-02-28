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
const month = require("./router/month");
const trophie = require("./router/trophies");
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

app.use("/", route);
app.use("/waves/api/v1/poolevent", poolevent);
app.use("/waves/api/v1/application", application);
app.use("/waves/api/v1/vote", vote);
app.use("/waves/api/v1/comment", comment);
app.use("/waves/api/v1/notification", notification);
app.use("/waves/api/v1/favorite", favorite);
app.use("/waves/api/v1/user", user);
app.use("/waves/api/v1/eventtype", eventtype);
app.use("/waves/api/v1/month", month);
app.use("/waves/api/v1/trophie", trophie);

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

const port = process.env.PORT || 5000;

server.listen(port, () => {
  console.log(
    `App running in ${port} mode on port ${port}`.green.bold
  );
});

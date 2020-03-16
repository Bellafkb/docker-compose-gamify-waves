const router = require("express").Router();
const { iniDbConnection } = require("../middleware/initDbConnection");
const { handleResponse } = require("../middleware/handleResponse");

const { getAllMonths } = require("../controller/monthController");

router.route("/").get(iniDbConnection, getAllMonths, handleResponse); //private

module.exports = router;

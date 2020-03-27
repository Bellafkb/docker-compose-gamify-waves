const router = require("express").Router();
const { getAllUsers, fetchUserById } = require("../controller/userController");
const { handleResponse } = require("../middleware/handleResponse");

router.route("/").get(getAllUsers, handleResponse); //private
router.route("/:id").get(fetchUserById); //private todo

module.exports = router;

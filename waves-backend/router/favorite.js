const router = require("express").Router();
const { verify } = require("../middleware/tokenChecker");
const { iniDbConnection } = require("../middleware/initDbConnection");
const { handleResponse } = require("../middleware/handleResponse");

const {
  deleteFavorite,
  getFavoriteByUserId,
  postFavorite,
  getMostFavedPoolevents
} = require("../controller/favoritesController");

router.route("/").get(verify, iniDbConnection, getFavoriteByUserId, handleResponse); //private

router.route("/:id").delete(verify, iniDbConnection, deleteFavorite, handleResponse); //private

router.route("/").post(verify, iniDbConnection , postFavorite, handleResponse); //private

router.route("/most/me").get(getMostFavedPoolevents); //private

module.exports = router;

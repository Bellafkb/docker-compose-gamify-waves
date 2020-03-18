const router = require("express").Router();
const { getRegions } = require("../controller/regionController");
const { getAllMonths } = require("../controller/monthController");
const { authenticate } = require("../controller/oauthController");
const { getInformation } = require("../controller/infoController");
const { verify} = require("../middleware/tokenChecker");
const { pooleventAccessControl } = require("../middleware/accessControlChecker");
const { getApplicationsUser } = require("../controller/applicationController");

router.get("/", (req, res) => {
  res.json({
    success: true,
    message: "i'm alive!"
  });
});

router.route("/regions").get(getRegions);

router.route("/months").get(getAllMonths);

router.route("/onboarding").get(getApplicationsUser);

router.route("/oauth").get(authenticate);

router.route("/info").get(verify, pooleventAccessControl, getInformation);

module.exports = router;

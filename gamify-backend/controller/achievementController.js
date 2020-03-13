const {
  fetchAchievements,
  createAchievement
} = require("../service/achievementService");
const {validationResult} =require("express-validator")

exports.getAchievements = async (req, res) => {
  try {
    const achievements = await fetchAchievements();
    res.status(200).json({
      success: true,
      progress: achievements
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message
    });
  }
};

//type has to be in challenges => multiplicity
exports.postAchievement = async (req, res) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(422).json({
        success: false,
        errors: errors.array()
      });
    }
    const { badge, challenge } = req.body;
    const { name, img_url, desc } = badge;
    const { points, type } = challenge;

    const achievementProgress = await createAchievement(
      name,
      desc,
      type,
      img_url,
      points
    );
    res.status(200).json({
      success: true,
      progress: achievementProgress
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message
    });
  }
};

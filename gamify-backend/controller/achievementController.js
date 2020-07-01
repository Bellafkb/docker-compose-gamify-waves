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

exports.postAchievement = async (req, res) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(422).json({
        success: false,
        errors: errors.array()
      });
    }
    const { badge, challenges } = req.body;
    const { name, img_url, desc } = badge;

    const achievement = await createAchievement(
      name,
      desc,
      img_url,
      challenges
    );
    res.status(200).json({
      success: true,
      data: achievement
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message
    });
  }
};

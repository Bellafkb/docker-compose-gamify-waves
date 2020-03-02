const {
  fetchAchievements,
  createAchievement
} = require("../service/achievementService");

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
    const { name, desc } = req.body;
    const achievementProgress = await createAchievement(name, desc);
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

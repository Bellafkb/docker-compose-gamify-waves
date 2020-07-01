const { getCrewLeaderboard } = require("../service/crewRankingService");

exports.getRankedLeaderboard = async (req, res) => {
  try {
    const leaderboard = await getCrewLeaderboard();
    res.status(200).json({ success: true, leaderboard });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
};


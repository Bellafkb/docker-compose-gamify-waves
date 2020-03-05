const { getCrewLeaderboard } = require("../service/crewRankingService");

exports.getRankedLeaderboard = async (req, res) => {
  try {
    const leaderborad = await getCrewLeaderboard();
    res.status(200).json({ success: true, leaderborad });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
};


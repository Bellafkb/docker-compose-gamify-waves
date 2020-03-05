const { getCrewRanking } = require("../service/crewRankingService");

exports.getRankedLeaderboard = async (req, res) => {
  try {
    const leaderborad = await getCrewRanking();
    res.status(200).json({ success: true, leaderborad });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
};


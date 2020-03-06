const { isNewCrew, initUserProfile } = require("./userService");
const { handleAction } = require("./crewRankingService");

exports.handleMessage = async (category, userId, sourceId) => {
  try {
    if (!await isNewCrew(userId)) {
      await initUserProfile(userId);
    }
    await handleAction(category, userId, sourceId);
    return true;
  } catch (error) {
    throw error;
  }
};

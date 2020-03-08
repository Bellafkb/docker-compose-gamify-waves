const { isNewUser, createUser } = require("./userService");
const {
  handleAction,
  createLeaderboardEntry
} = require("./crewRankingService");
const { initNewUserAchievement } = require("./achievementService");
const { createCrew, fetchCrewByUserId, isNewCrew } = require("./crewService");

exports.handleMessage = async (category, userId, sourceId) => {
  try {
    const { id, name } = await fetchCrewByUserId(userId);

    if (!(await isNewUser(userId))) {
      await createUser(userId, id);
      await initNewUserAchievement(userId);
    }

    if (!(await isNewCrew(id))) {
      await createCrew(id, name);
      await createLeaderboardEntry(id);
    }
    //todo add crewid--> id = crewId
    await handleAction(category, userId, sourceId, id);
    return true;
  } catch (error) {
    throw error;
  }
};

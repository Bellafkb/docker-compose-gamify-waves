const { generateUuid, getDateNow } = require("../helper");
const { createBadge } = require("../service/badgeService");
const { getAllUsers } = require("../service/userService");
const { createChallengeProgress } = require("../service/progressService");
const {
  createChallenge,
  getAllChallengesIds
} = require("../service/challengesService");

exports.fetchAchievements = async () => {
  try {
    const achievements = await global.conn.query(`select * from achievements;`);
    return achievements;
  } catch (error) {
    throw error;
  }
};

exports.createAchievement = async (name, desc, type, img_url, points) => {
  try {
    console.log(name, desc, type, img_url, points);
    const timestamp = getDateNow();
    const uuid = generateUuid();
    const badge = await createBadge(name, desc, type, img_url);
    const challenge = await createChallenge(type, points);
    await global.conn.query("insert into achievements value (?,?,?,?)", [
      uuid,
      timestamp,
      badge.idbadge,
      challenge.idchallenge
    ]);
    this.initNewAchievementForUsers(challenge.idchallenge);
    return {
      badge,
      challenge,
      achievement: {
        idachievement: uuid,
        timestamp,
        idbadge: badge.idbadge,
        idchallenge: challenge.idchallenge
      }
    };
  } catch (error) {
    throw error;
  }
};

exports.initNewUserAchievement = async userId => {
  try {
    const challengeIds = await getAllChallengesIds();
    challengeIds.map(async ({ idchallenge }) => {
      await createChallengeProgress(userId, idchallenge);
    });

    return true;
  } catch (error) {
    throw error;
  }
};

exports.initNewAchievementForUsers = async idchallenge => {
  try {
    const users = await getAllUsers();
    if (users.length > 0) {
      users.map(async ({ iduser }) => {
        await (iduser, idchallenge);
      });
    }
    return true;
  } catch (error) {
    throw error;
  }
};

const { generateUuid, getDateNow } = require("../helper");
const { createBadge } = require("../service/badgeService");
const { getAllUsers } = require("../service/userService");
const { createChallengeProgress } = require("../service/progressService");
const {
  createChallenge,
  getAllChallengesIds
} = require("../service/challengesService");
const { connectToDb } = require("../config/connectMysql");

exports.fetchAchievements = async () => {
  try {
    const conn = await connectToDb();
    const achievements = await conn.query(`select * from achievements a 
    left join challenges c on a.challenge_id =c.idchallenge 
    left join badges b on b.idbadge =a.badge_id;`);
    conn.end();
    conn.destroy()

    return achievements;
  } catch (error) {
    throw error;
  }
};

exports.createAchievement = async (name, desc, type, img_url, points) => {
  try {
    const conn = await connectToDb();
    const timestamp = getDateNow();
    const uuid = generateUuid();
    const badge = await createBadge(name, desc, type, img_url);
    const challenge = await createChallenge(type, points);
    await conn.query("insert into achievements value (?,?,?,?)", [
      uuid,
      timestamp,
      badge.idbadge,
      challenge.idchallenge
    ]);
    this.initNewAchievementForUsers(challenge.idchallenge);
    conn.end()
    conn.destroy()
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
        await createChallengeProgress(iduser, idchallenge);
      });
    }
    return true;
  } catch (error) {
    throw error;
  }
};

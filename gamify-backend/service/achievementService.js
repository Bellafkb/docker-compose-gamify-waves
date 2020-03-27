const { generateUuid, getDateNow } = require("../helper");
const { createBadge } = require("../service/badgeService");
const { getAllUsers } = require("../service/userService");
const { createChallengeProgress } = require("../service/progressService");
const {
  createChallenges,
  getAllChallengesIds
} = require("../service/challengesService");
const { connectToDb } = require("../config/connectMysql");

exports.fetchAchievements = async () => {
  try {
    const conn = await connectToDb();
    const badges = await conn.query(`select * from badges`);
    const populatedAchievements = await Promise.all(
      badges.map(async badge => {
        const challenges = await conn.query(
          `select * from achievements 
          b left join achievements 
          a on b.badge_id = a.badge_id 
          and b.challenge_id != a.challenge_id where a.badge_id=?`,
          [badge.idbadge]
        );
        const populatedChallenges = await Promise.all(
          challenges.map(async ({ challenge_id }) => {
            return await conn.query(
              "select * from challenges where idchallenge=?",
              [challenge_id]
            );
          })
        );
        return {
          badge,
          challenges: populatedChallenges
        };
      })
    );

    conn.end();
    return populatedAchievements;
  } catch (error) {
    throw error;
  }
};

exports.createAchievement = async (name, desc, img_url, challenges) => {
  try {
    const conn = await connectToDb();
    const timestamp = getDateNow();
    const badge = await createBadge(name, desc, img_url);
    const challenges_resp = await createChallenges(challenges);
    await challenges_resp.forEach(async challenge => {
      let uuid = generateUuid();
      await conn.query("insert into achievements value (?,?,?,?)", [
        uuid,
        timestamp,
        badge.idbadge,
        challenge.idchallenge
      ]);
    });
    this.initNewAchievementForUsers(challenges_resp);
    conn.end();
    return {
      badge,
      challenges: challenges_resp,
      achievement: {
        timestamp,
        idbadge: badge.idbadge
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

exports.initNewAchievementForUsers = async challenges => {
  try {
    const users = await getAllUsers();
    if (users.length > 0) {
      challenges.forEach(({ idchallenge }) => {
        users.forEach(async ({ iduser }) => {
          await createChallengeProgress(iduser, idchallenge);
        });
      });
    }
    return true;
  } catch (error) {
    throw error;
  }
};

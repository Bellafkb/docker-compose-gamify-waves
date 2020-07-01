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
    const achievements = await conn.query(`select 
    c.type, 
    c.points, 
    b.img_url, 
    b.desc 
    from achievements a 
    left join challenges c on a.challenge_id =c.idchallenge 
    left join badges b on b.idbadge =a.badge_id;`);
    conn.end();
    return achievements;
  } catch (error) {
    throw error;
  }
};

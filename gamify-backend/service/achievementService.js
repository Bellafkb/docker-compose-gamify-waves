const { generateUuid, getDateNow } = require("../helper");
const { createBadge } = require("../service/badgeService");
const { createChallenge } = require("../service/challengesService");
const { getAllUsers } = require("../service/userService");


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
//TODO: init achievements
exports.initNewUserAchievement = async (idchallenge) => {
  try {
    const timestamp= getDateNow()
    const users = await getAllUsers();
    if(users.length>0){
      users.map(({iduser})=>{
        await global.conn.query(
          "INSERT INTO challenge_progress value (?,?,?,?,?,?)",
          [iduser, idchallenge, 0, timestamp, timestamp, generateUuid() ]
        );
      })
    }
    
    return true;
  } catch (error) {
    throw error;
  }
};

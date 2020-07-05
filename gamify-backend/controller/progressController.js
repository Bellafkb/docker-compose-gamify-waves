const { connectToDb } = require("../config/connectMysql");

exports.getMyAchievementProgress = async (req, res) => {
  try {
    const user_id = req.params.userId;
    console.log(user_id);
    const conn = await connectToDb();
    const badges = await conn.query("select * from badges;");
    const achievements = await Promise.all(
      badges.map(async badge => {
        let challenges = await conn.query(
          "select a.challenge_id from achievements a where badge_id=?",
          [badge.idbadge]
        );
        let challengesArray = challenges.map(
          ({ challenge_id }) => challenge_id
        );
        badge.progress = await Promise.all(
          challengesArray.map(async challenge_id => {
            return await conn.query(
              `select cp.score, 
                cp.completed, 
                c.type, 
                c.points 
                from challenge_progress cp 
                join challenges c on 
                c.idchallenge=cp.challenge_id  
                where challenge_id=? and cp.user_id=?`,
              [challenge_id, user_id]
            );
          })
        );
        return badge;
      })
    );
    conn.end();
    res.status(200).json({
      achievements
    });
  } catch (error) {
    res.status(400).json({
      message: error.message
    });
  }
};

/**
 * 
 * SELECT 
    b.name, 
    b.desc , 
    b.img_url, 
    cp.score, 
    cp.completed  
    from achievements a 
    left join challenge_progress cp 
    on cp.challenge_id = a.challenge_id
    left join badges b 
    on b.idbadge = a.badge_id 
    where cp.user_id=? ;
 * 
 */

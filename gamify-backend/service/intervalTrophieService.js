const { connectToDb } = require("../config/connectMysql");
const { generateUuid, getDateNow } = require("../helper");

(async () => {
  setInterval(async() => {
    const scores =await this.getTodaysCreatedEvents()
    await this.saveTrophies(scores)
  }, 3000000);
})();

exports.getTodaysCreatedEvents = async () => {
  try {
    const conn = await connectToDb();
    const timestamp = new Date().getTime();
    const startTimestamp = new Date(timestamp).setHours(0, 0, 0, 0);
    const events = await conn.query(
      `select source_id ,count(*) as num 
      from action_history  
      where category!='EVENT_CREATED'
      AND created_at>? 
      group by source_id 
      order by num DESC LIMIT 3;`,
      [startTimestamp]
    );
    console.log("-->", events);
    conn.end();

    return events;
  } catch (error) {
    throw error;
  }
};

exports.saveTrophies = async scores => {
  try {
    const conn = await connectToDb();
    const trophies = ["GOLD", "SILVER", "BRONZE"];
    scores.forEach(async (score, i) => {
      let idtrophie = generateUuid();
      let created_at = getDateNow();
      await conn.query(
        `insert into interval_trophies 
          (idtrophie, trophie, sourceId, created_at) 
          value (?,?,?,?)`,
        [idtrophie, trophies[i], score.source_id, created_at]
      );
    });

    conn.end();
    return true;
  } catch (error) {
    throw error;
  }
};

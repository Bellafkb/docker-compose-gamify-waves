const { connectToDb } = require("../config/connectMysql");

exports.getTrophiesByUserId = async (req, res) => {
  try {
    const conn = await connectToDb();
    const trophies = await conn.query(`select * from interval_trophies where idtrophie=?`,[req.params.userId]);
    res.status(200).json({ success: true, trophies });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
};
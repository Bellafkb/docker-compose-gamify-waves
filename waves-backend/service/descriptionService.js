const {generateUuid} =require("../helper")
const {connect} = require("../config/connectMysql")

exports.saveDescription = async (description, callback) => {
  try {
    const conn = await connect()
    description.id=generateUuid()
    const sql = "INSERT INTO descriptions SET ?;";
    conn.query(sql, description, (error, resp) => {
      if (!error) {
        conn.end()
        callback(null, resp);
      } else {
        conn.end()
        callback(error);
      }
    });
  } catch (error) {
    conn.end()    
    callback(error);
  }
};

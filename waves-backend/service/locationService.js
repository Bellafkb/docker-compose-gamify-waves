const {connect} = require("../config/connectMysql")
const {generateUuid} = require("../helper")

exports.saveLocation = async (location, callback) => {
  try {
    const conn = await connect()
    const uuid = generateUuid()
    location.id= uuid
    const sql = "INSERT INTO locations SET ?;";
    conn.query(sql, location, (error, resp) => {
      if (!error) {
        callback(null, location);
      } else {
        callback(error);
      }
    });
  } catch (error) {
    callback(error);
  }
};

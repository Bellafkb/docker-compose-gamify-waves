const {connectToDb} = require("../config/connectMysql")
exports.getUserProfileById = id => {};




exports.getAllUsers = async () => {
  try {
    const conn = await connectToDb()
    const users = await conn.query("SELECT u.iduser FROM users AS u;");
    conn.end()
    return users;
  } catch (error) {
    throw error;
  }
};

exports.isNewUser = async userId => {
  try {
    const conn = await connectToDb()
    const user = await conn.query("select * from users where iduser=?", [
      userId
    ]);
    await conn.end()
    return user.length == 0;
  } catch (error) {
    throw error;
  }
};

exports.createUser = async (userId, crewId) => {
  try {
    const conn = await connectToDb()
    await conn.query("INSERT INTO users value (?,?)", [userId, crewId]);
    conn.end()
    return {
      userId,
      crewId
    };
  } catch (error) {
    throw error;
  }
};

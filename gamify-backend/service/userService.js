exports.getUserProfileById = id => {};




exports.getAllUsers = async () => {
  try {
    const users = await global.conn.query("SELECT u.iduser FROM users AS u;");
    return users;
  } catch (error) {
    throw error;
  }
};

exports.isNewUser = async userId => {
  try {
    const user = await global.conn.query("select * from users where iduser=?", [
      userId
    ]);
    return user.length > 0;
  } catch (error) {
    throw error;
  }
};

exports.createUser = async (userId, crewId) => {
  try {
    await global.conn.query("INSERT INTO users value (?,?)", [userId, crewId]);
    return {
      userId,
      crewId
    };
  } catch (error) {
    throw error;
  }
};

const { v4 } = require("uuid");

exports.createCacheKey = (key, tableName) => {
  return `${tableName}_${key}`;
};

exports.generateUuid = () => {
  return v4();
};

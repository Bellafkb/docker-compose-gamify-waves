const { v4 } = require("uuid");

exports.createCacheKey = (key, tableName) => {
  return `${tableName}_${key}`;
};

exports.generateUuid = () => {
  return v4();
};

exports.getDateNow = () => {
  return new Date().getTime();
};

exports.REDIS_CHANNELS = {
  WAVES: "WAVES"
};

exports.ACTIONS = {
  VOTE: "VOTE",
  EVENT_CREATED: "EVENT_CREATED",
  COMMENT: "COMMENT",
  APPLICATION: "APPLICATION"
};

exports.TEST_USER = {
  userId: "8d411dc4-e76f-4d0e-a027-056a0bc43be5"
};
exports.createCacheKey = (key, tableName) => {
  return `${tableName}_${key}`;
};

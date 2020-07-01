exports.getRegions = (req, res,next) => {
  const sql = "SELECT DISTINCT l.locality FROM locations as l;";
  req.conn.query(sql, (error, regions) => {
    if (error) {
      req.error=error
      next()
    } else {
      req.data = regions
      next()
    }
  });
};

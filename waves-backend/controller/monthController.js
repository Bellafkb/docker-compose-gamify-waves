
exports.getAllMonths = (req, res,next) => {
  const sql = `SELECT DISTINCT
    (MONTHNAME(DATE(p.event_start))) as month
    FROM wavesdb.poolevents p;`;
  req.conn.query(sql, async (error, months) => {
    if (error) {
      req.error = error
      return next()
    } else {
      const result = await months.map(({ month }) => month);
      req.data = result
      next()
    }
  });
};

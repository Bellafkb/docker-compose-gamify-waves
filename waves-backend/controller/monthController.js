exports.getAllMonths = (req, res, next) => {
  const sql = `SELECT DISTINCT
    (MONTHNAME(DATE(p.event_start))) as month
    FROM wavesdb.poolevents p;`;
  req.conn.query(sql, (error, months) => {
    if (error) {
      req.error = error;
      next();
    } else {
      const result = months.map(({ month }) => month);
      req.data = result;
      next();
    }
  });
};

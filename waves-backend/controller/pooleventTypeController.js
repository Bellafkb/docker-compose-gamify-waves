exports.postPeType = (req, res) => {
  const { body } = req;
  req.conn.query("insert into poolevent_types set ?", body, (error, type) => {
    if (error) {
    }
    res.json({ success: true, type });
  });
};

exports.getAllPeType = async (req, res, next) => {
  req.conn.query("select * from poolevent_types;", (error, types) => {
    if (error) {
      req.error = error;
      next();
    }
    req.data = types;
    next();
  });
};

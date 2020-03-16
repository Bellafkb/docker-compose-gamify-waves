exports.handleResponse = (req, res) => {
  const { error, data } = req;
  if (error) {
    req.conn.end();
    return res.status(500).json({
      success: false,
      message: error.message
    });
  }
  req.conn.end();
  return res.status(200).json({
    success: true,
    data
  });
};

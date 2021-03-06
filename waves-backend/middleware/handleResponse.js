exports.handleResponse = (req, res) => {
  const { error, data } = req;
  if (req.conn) {
    req.conn.end();
  }
  if (error) {
    return res.status(500).json({
      success: false,
      message: error.message
    });
  }

  return res.status(200).json({
    success: true,
    data
  });
};

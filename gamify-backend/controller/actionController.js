const { getActions, createAction ,queryAcionsTypes} = require("../service/actionsService");

exports.getAcions = async (req, res) => {
  try {
    const actions = await getActions();
    res.status(200).json({
      success: true,
      actions
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message  
    });
  }
};

exports.postActions = async (req, res) => {
  try {
    const { name, points, type } = req.body;
    const action = await createAction(name, points, type);
    res.status(200).json({
      success: true,
      action
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message
    });
  }
};

exports.getAcionsTypes = async (req, res, next) => {
  try {
    const types = await queryAcionsTypes();
    req.data = types;
    next();
  } catch (error) {
    req.error = error;
    next();
  }
};

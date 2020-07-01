const { incrementFaveCount } = require("../service/pooleventService");
const { generateUuid, getDateNow } = require("../helper");

// @desc get favorite by userId
// @route GET /api/v1/favorite/:id
// @access private
exports.getFavoriteByUserId = (req, res, next) => {
  const { userId } = req.user;
  const sql = `SELECT 
  l.*, 
  pt.*,
  p.idevent,
  p.name,
  p.website,
  p.event_start,
  p.event_end 
  FROM favorites f 
  LEFT JOIN poolevents p ON f.poolevent_id=p.idevent 
  LEFT join locations l on l.poolevent_id=p.idevent
  LEFT join poolevent_types pt on p.idevent_type=pt.idevent_type
  WHERE f.user_id='${userId}';`;
  req.conn.query(sql, (err, favorites) => {
    if (err) {
      req.error = err;
      next();
    } else {
      req.data = favorites;
      next();
    }
  });
};

// @desc  create favorite
// @route POST /api/v1/favorite
// @access Private
exports.postFavorite = (req, res, next) => {
  const { body, user } = req;
  body.user_id = user.userId;
  const idfavorite = generateUuid();
  const created_at = getDateNow();
  body.idfavorite = idfavorite;
  body.created_at = created_at;

  const sql = `INSERT INTO favorites SET ?`;
  req.conn.query(sql, body, (error, favorite) => {
    if (error) {
      req.error = error;
      next();
    } else {
      incrementFaveCount(body.poolevent_id, (error, resp) => {
        if (error) {
          req.error = error;
          next();
        }
        req.data = body;
        next();
      });
    }
  });
};

// @desc delete favorite by id
// @route DELETE /api/v1/favorite/:id
// @access Private
exports.deleteFavorite = (req, res) => {
  const { id } = req.user;
  const sql = `DELETE FROM favorites f WHERE f.poolevent_id='${id}';`;
  global.conn.query(sql, (error, resp) => {
    if (error) {
      res.status(400).json({
        success: false,
        message: `Error in deletefavorite ${error.message}`
      });
    } else {
      res.status(200).json({
        success: true,
        data: resp
      });
    }
  });
};

// @desc delete favorite by id
// @route DELETE /api/v1/favorite/:id
// @access Private
exports.getMostFavedPoolevents = (req, res) => {
  const sql = `select *, pt.name as type_name ,p.name as pe_name from poolevents p 
  join poolevent_types pt on pt.idevent_type = p.idevent_type
  where p.state="released"
  order by 
  p.fave_count desc LIMIT 10;`;
  global.conn.query(sql, (error, resp) => {
    if (error) {
      res.status(400).json({
        success: false,
        message: `getMostFavedPoolevents ${error.message}`
      });
    } else {
      res.status(200).json({
        success: true,
        recomandations: resp
      });
    }
  });
};

const { validationResult } = require("express-validator");
const { savePoolevent } = require("../service/pooleventService");
const { saveLocation } = require("../service/locationService");
const { saveDescription } = require("../service/descriptionService");
const { getEntriesByTableName } = require("../service/abstractService");
const { fetchUserById } = require("../service/usersService");
const { connect } = require("../config/connectMysql");
const { publish } = require("../service/publisherService");
const { ACTIONS, REDIS_CHANNELS } = require("../helper");

// @desc get all poolevents
// @route GET /api/v1/poolevent
// @access Public
exports.getPoolEvents = async (req, res, next) => {
  let filter = "";
  let { limit, type, region, state, start, page } = req.query;
  if (!limit) {
    limit = 10;
  }

  if (!page) {
    page = 0;
  }

  if (state) {
    filter += `p.state="${state}"`;
  } else {
    filter += `p.state="RELEASED"`;
  }

  if (type) {
    filter += `AND p.idevent_type=${type}`;
  }

  if (region) {
    filter += ` AND l.locality="${region}"`;
  }
 
  if (start) {
    filter += ` AND monthname(p.event_start)="${start}"`;
  }

  const sql = `SELECT 
  p.idevent, 
  p.name,
  p.supporter_lim, 
  p.event_start,
  p.event_end,
  p.application_end, 
  p.state, 
  l.route, 
  l.street_number,
  l.locality,
  l.postal_code,
  pt.name as type_name
  FROM poolevents p 
  JOIN locations l ON l.poolevent_id=p.idevent 
  JOIN poolevent_types pt 
  ON p.idevent_type=pt.idevent_type
  WHERE ${filter} 
  LIMIT ${limit} 
  OFFSET ${limit * page};`;
  req.conn.query(sql, (error, poolevents) => {
    if (error) {
      req.error = error;
      return next();
    }
    getEntriesByTableName("poolevents", (error, entriesCount) => {
      if (error) {
        req.error = error;
        return next();
      }
      req.data = {
        poolevents,
        count: +entriesCount[0].count,
        page: +page,
        size: +limit
      };
      next();
    });
  });
};

// @desc get poolevent by id
// @route GET /api/v1/poolevent/:id
// @access Public
exports.getPoolEventById = (req, res, next) => {
  const { id } = req.params;
  const sql = `SELECT *,pt.name as type_name, pt.idevent_type, 
              p.name as event_name FROM poolevents AS p  
              LEFT JOIN locations l ON p.idevent=l.poolevent_id 
              LEFT JOIN descriptions d ON d.poolevent_id=p.idevent
              LEFT JOIN poolevent_types pt ON pt.idevent_type=p.idevent_type
              WHERE p.idevent='${id}';`;
  req.conn.query(sql, (err, poolevent) => {
    if (err) {
      req.error = err;
      next();
    } else {
      if (poolevent.length > 0) {
        const {
          idevent_type,
          user_id,
          asp_event_id,
          event_name,
          poolevent_id,
          route,
          street_number,
          country,
          type_name,
          locality,
          postal_code,
          desc,
          longitude,
          latitude,
          event_start,
          event_end,
          application_start,
          application_end,
          website,
          supporter_lim,
          state,
          text,
          html,
          trophie
        } = poolevent[0];
        fetchUserById(asp_event_id, (error, asp_event_id) => {
          if (error) {
            console.log(error);
            req.error = error;
            return next();
          }
          console.log(asp_event_id);
          fetchUserById(user_id, (error, user) => {
            if (error) {
              req.error = error;
              next();
            }
            res.status(200).json({
              success: true,
              data: {
                idevent_type,
                poolevent_id,
                event_name,
                type_name,
                event_start,
                event_end,
                application_start,
                application_end,
                website,
                supporter_lim,
                state,
                asp: asp_event_id,
                user,
                location: {
                  route,
                  street_number,
                  country,
                  locality,
                  postal_code,
                  desc,
                  longitude,
                  latitude
                },
                description: {
                  text,
                  html
                },
                trophie
              }
            });
          });
        });
      } else {
        next();
      }
    }
  });
};

// @desc  create poolevent
// @route POST /api/v1/poolevent
// @access Private
exports.postPoolEvent = (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(422).json({
      success: false,
      errors: errors.array()
    });
  }
  const { front, location, description } = req.body;
  front.user_id = req.user.id;

  //front.user_id = "4a74141e-c2c0-46a0-9c0c-84bef8be7d0f";
  savePoolevent(front, (error, { idevent }) => {
    if (error) {
      res.status(400).json({
        message: error.message
      });
    }
    location.poolevent_id = idevent;
    saveLocation(location, (error, locationResp) => {
      if (error) {
        next();
      }
      description.poolevent_id = idevent;
      saveDescription(description, (error, descriptionResp) => {
        if (error) {
          res.status(400).json({ message: error.message });
        }
        publish(
          REDIS_CHANNELS.WAVES,
          ACTIONS.EVENT_CREATED,
          front.user_id,
          idevent
        );
        res.status(200).json({
          location: locationResp,
          poolevent: idevent,
          description: descriptionResp
        });
      });
    });
  });
};

// @desc delete poolevent by id
// @route DELETE /api/v1/poolevent/:id
// @access Private
exports.deletePoolEvent = (req, res) => {
  const { id } = req.params;
  global.conn.query(
    `DELETE FROM locations l WHERE l.poolevent_id=${id}`,
    (error, l) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in deletePoolevent ${error.message}`
        });
      }
      global.conn.query(
        `DELETE FROM descriptions d WHERE d.poolevent_id=${id}`,
        (error, d) => {
          if (error) {
            res.status(400).json({
              success: false,
              message: `Error in deletePoolevent ${error.message}`
            });
          }
          global.conn.query(
            `DELETE FROM poolevents WHERE poolevents.id='${id} ';`,
            (error, resp) => {
              if (error) {
                res.status(400).json({
                  success: false,
                  message: `Error in deletePoolevent ${error.message}`
                });
              } else {
                res.status(200).json({
                  success: true,
                  data: resp
                });
              }
            }
          );
        }
      );
    }
  );
};

// @desc edit poolevent by id
// @route PUT /api/v1/poolevent/:id
// @access Private
exports.putPoolEvent = async (req, res, next) => {
  const { front, location, description } = req.body;
  const { id } = req.params;
  req.conn.query(
    `UPDATE poolevents SET ? WHERE idevent ='${id}';`,
    front,
    (error, resp) => {
      if (error) {
        req.error = error;
        next();
      } else {
        if (location) {
          req.conn.query(
            `UPDATE locations set ? where poolevent_id='${id}'`,
            location,
            (error, response) => {
              if (error) {
                req.error = error;
                next();
              }
            }
          );
          if (description) {
            req.conn.query(
              `UPDATE descriptions set ? where poolevent_id='${id}'`,
              description,
              (error, response) => {
                if (error) {
                  req.error = error;
                  next();
                }
                req.data = response;
                next();
              }
            );
          } else {
            req.data = response;
            next();
          }
        } else if (description) {
          req.conn.query(
            `UPDATE descriptions set ? where poolevent_id='${id}'`,
            description,
            (error, response) => {
              if (error) {
                req.error = error;
                next();
              }
            }
          );
        } else {
          req.data = resp;
          next();
        }
      }
    }
  );
};

// @desc get poolevent by id
// @route GET /api/v1/poolevent/:id
// @access Public
exports.getPoolEventByUserId = async (req, res, next) => {
  const { userId } = req.user;
  req.conn.query(
    `SELECT 
    p.idevent, 
    p.name,
    p.event_start,
    p.event_end,
    p.application_end, 
    p.state, 
    l.route, 
    l.street_number,
    l.locality,
    l.postal_code,
    pt.name as type_name 
    FROM poolevents p 
    join locations l on l.poolevent_id=p.idevent 
    join poolevent_types pt on pt.idevent_type=p.idevent_type
    WHERE user_id='${userId}';`,
    (error, resp) => {
      if (error) {
        req.error = error;
        next();
      } else {
        console.log(resp);
        req.data = resp;
        next();
      }
    }
  );
};

// @desc edit poolevent by id
// @route PUT /api/v1/poolevent/:id
// @access Private
exports.getSoonStartingEvents = async (req, res, next) => {
  const conn = await connect();
  req.conn = conn;
  conn.query(
    `select * from poolevents p order by event_start;`,
    (error, resp) => {
      if (error) {
        req.error = error;
        next();
      } else {
        req.data = resp;
        next();
      }
    }
  );
};

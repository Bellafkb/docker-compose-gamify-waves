const { fetchUserById } = require("../service/usersService");
const { connect } = require("../config/connectMysql");
const { generateUuid, getDateNow } = require("../helper");
const { publish } = require("../service/publisherService");
const { REDIS_CHANNELS, ACTIONS } = require("../helper");

// @desc get all applications by poolevent
// @route GET /api/v1/application/event/:id
// @access Private
exports.getApplicationsEvent = async (req, res, next) => {
  if (req.params) {
    const { id } = req.params;
    req.conn.query(
       `SELECT a.created_at,
        a.idapplication as application_id,
        a.text,
        a.state,
        a.user_id
        FROM applications a
        WHERE a.poolevent_id='${id}';`,
      (error, applications) => {
        if (error) {
          req.error = error;
          next();
        }
        getStatistic(applications, async (error, state_and_apps) => {
          if (error) {
            req.error = error;
            next();
          }

          resolveUserId(applications, (err, result) => {
            if (err) {
              req.error = err;
              next();
            }
            req.data = result;
            next();
          });
        });
      }
    );
  } else {
    req.error = error;
    next();
  }
};

const getStatistic = async (applications, callback) => {
  let result = [];
  const conn = await connect();
  applications.map((application, i) => {
    conn.query(
      `select * from  
      (select count(*) as rejected_count 
      from applications where state="rejected" 
      and user_id="${application.user_id}") 
      as rejected, 
      (select count(*) as accepted_count 
      from applications 
      where state="accepted" 
      and user_id="${application.user_id}") 
      as accepted;`,
      (error, resp) => {
        conn.end();
        if (error) {
          callback(error);
        } else {
          application.statistic = resp[0];
          result.push(application);
          if (applications.length - 1 == i) {
            callback(null, result);
          }
        }
      }
    );
  });
};

// @desc get applications by user
// @route GET /api/v1/application/user
// @access Private
exports.getApplicationsUser = (req, res, next) => {
  const { userId } = req.user;
  const query = `SELECT 
  a.created_at, 
  a.text, 
  a.state, 
  p.name, 
  a.poolevent_id, 
  a.idapplication 
  FROM applications a 
  JOIN poolevents p 
  on a.poolevent_id=p.idevent 
  WHERE a.user_id="${userId}";`;

  req.conn.query(query, (error, applications) => {
    if (error) {
      req.error = error;
      next();
    }
    req.data = applications;
    next();
  });
};

// @desc get application by id
// @route GET /api/v1/application/:id
// @access Private
exports.getApplicationById = (req, res, next) => {
  const { id } = req.user;
  req.conn.query(
    `SELECT * FROM applications p WHERE p.idevent='${id}';`,
    (err, application) => {
      if (err) {
        req.error = err;
        next();
      } else {
        req.data = application;
        next();
      }
    }
  );
};

// @desc  create application
// @route POST /api/v1/application
// @access Private
exports.postApplication = (req, res, next) => {
  const { body } = req;
  const { userId } = req.user;
  body.user_id = userId;
  body.idapplication = generateUuid();
  body.created_at = getDateNow();
  body.updated_at = getDateNow();

  req.conn.query(`INSERT INTO applications SET ?`, body, (error, response) => {
    if (error) {
      req.error = error;
      console.log(error);
      next();
    } else {
      publish(
        REDIS_CHANNELS.WAVES,
        ACTIONS.APPLICATION,
        userId,
        body.idapplication
      );
      req.data = body;
      next();
    }
  });
};

// @desc delete application by id
// @route DELETE /api/v1/application/:id
// @access Private
exports.deleteApplication = (req, res, next) => {
  const { id } = req.user;

  req.conn.query(
    `DELETE FROM applications WHERE applications.id='${id}';`,
    (error, resp) => {
      if (error) {
        req.error = error;
        next();
      } else {
        req.error = resp;
        req.data = resp;
      }
    }
  );
};

// @desc edit application by id
// @route PUT /api/v1/application/:id
// @access Private
exports.putApplication = (req, res, next) => {
  const { body } = req;
  const { id } = req.params;
  req.conn.query(
    `UPDATE applications SET ? WHERE id="${id}";`,
    body,
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

// @desc edit application by id
// @route GET /api/v1/application/:id/user/statistic
// @access Private
exports.getApplicationStatisticByUserId = (req, res, next) => {
  const { userId } = req.params;
  req.conn.query(
    `select * from  
    (select count(*) as rejected_count from applications where state="rejected" and user_id="${userId}")as rejected, 
    (select count(*)as accepted_count from applications where state="accepted" and user_id="${userId}") as accepted;`,
    (error, resp) => {
      if (error) {
        req.error = error;
        next();
      } else {
        req.data = data;
        next();
      }
    }
  );
};

const resolveUserId = async (applications, callback) => {
  try {
    let result = [];
    applications.map(async (app, i) => {
      app.user = await fetchUserById(app.user_id, (err, user) => {
        if (err) {
          callback(err);
        }
        app.user = user;
        if (applications.length - 1 == i) {
          return callback(null, applications);
        }
      });
    });
  } catch (error) {
    throw error;
  }
};

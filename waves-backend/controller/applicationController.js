const { fetchUserById } = require("../service/usersService");
const { connect } = require("../config/connectMysql");

// @desc get all applications by poolevent
// @route GET /api/v1/application/event/:id
// @access Private
exports.getApplicationsEvent = async (req, res, next) => {
  if (req.params) {
    const { id } = req.params;
    req.conn.query(
      `SELECT a.created_at,
      a.id as application_id,
      u.id as user_id,
      u.first_name,
      u.last_name,
      a.text,
      a.state
      FROM applications a
      JOIN users u ON u.id=a.user_id 
      WHERE a.poolevent_id=${id};`,
      (error, applications) => {
        if (error) {
          req.error = error;
          next();
        }
        getStatistic(applications, (error, app_stats) => {
          if (error) {
            req.error = error;
            next();
          }
          resolveUserId(app_stats, (error, app_stats_user) => {
            if (error) {
              req.error = error;
              next();
            }
            req.data = app_stats_user;
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
        if (error) {
          conn.end();
          callback(error);
        } else {
          conn.end();
          application.statistic = resp[0];
          result.push(application);
          if (applications.length - 1 == i) {
            conn.end();
            callback(null, result);
          }
        }
      }
    );
  });
};

// @desc get all applications by user
// @route GET /api/v1/application/user/:id
// @access Private
exports.getApplicationsUser = (req, res, next) => {
  const { id } = req.user;
  const query = `SELECT a.created_at, 
  a.text, 
  a.state, 
  p.name, 
  a.poolevent_id, 
  a.id 
  FROM applications a 
  JOIN poolevents p 
  on a.poolevent_id=p.id 
  WHERE a.user_id="${id}";`;

  req.conn.query(query, (error, applications) => {
    if (error) {
      req.error = error;
      next();
    }
    req.data = applications;
  });
};

// @desc get application by id
// @route GET /api/v1/application/:id
// @access Private
exports.getApplicationById = (req, res, next) => {
  const { id } = req.user;
  req.conn.query(
    `SELECT * FROM applications p WHERE p.id='${id}';`,
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
exports.postApplication = (req, res) => {
  const { body } = req;
  const { id } = req.user;
  body.user_id = id;
  req.conn.query(`INSERT INTO applications SET ?`, body, (error, response) => {
    if (error) {
      req.error = error;
      next();
    } else {
      req.data = response;
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
  let result = [];
  let i = 0;
  applications.map(application => {
    fetchUserById(application.user_id, (error, user) => {
      if (error) {
        callback(error);
      }
      application.user = user;
      result.push(application);

      if (applications.length - 1 === i) {
        callback(null, result);
      }
      i++;
    });
  });
};

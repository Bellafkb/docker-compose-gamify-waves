const {connect} = require("../config/connectMysql")

exports.iniDbConnection = async (req,res, next)=>{
    try {
        req.conn = await connect()
        next()
    } catch (error) {
        throw error.message
    }
} 
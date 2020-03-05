const { getDateNow } = require("../helper")

exports.createAction = async (name, points) => {
    try {
        const dbaction = await global.conn.query("INSERT INTO gamifydb.actions SET created_at = ?, id_action=?,points =?;", [getDateNow(), name, points])
        return dbaction
    } catch (error) {
        throw error
    }

}

exports.getActionById = async (action) => {
    try {
        const dbaction = await global.conn.query("SELECT * FROM actions WHERE id_action=?", action)
        return dbaction
    } catch (error) {
        throw error
    }
}

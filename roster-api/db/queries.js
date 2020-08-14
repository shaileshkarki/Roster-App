// // import the data base pool query settings
const { pool } = require("../dbConfig");

const runSql = async (sql, params) => {
  try {
    const results = await pool.query(sql, params);
    return results;
  } catch (error) {
    console.log("There has been an error!", error);
  }
};

module.exports = {
  runSql,
};

const { runSql } = require("./queries");

const getAllStaff = async () => {
  const sql = "Select * FROM staff ORDER BY lastname;";
  const { rows } = await runSql(sql, []);
  let allStaff = [];
  rows.forEach((row) => allStaff.push(row));

  return allStaff;
};

module.exports = {
  getAllStaff,
};

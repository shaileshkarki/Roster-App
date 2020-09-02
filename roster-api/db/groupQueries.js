const { runSql } = require("./queries");

const getAllGroups = async () => {
  try {
    const sql = "Select * FROM groups;";
    const { rows } = await runSql(sql, []);
    let allGroups = [];

    rows.forEach((row) => allGroups.push({ ...row, stackItems: true }));

    return allGroups;
  } catch (error) {
    console.log(error);
  }
};

module.exports = {
  getAllGroups,
};

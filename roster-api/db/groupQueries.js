const { runSql } = require("./queries");

const getAllGroups = async () => {
  try {
    const sql = "Select * FROM groups WHERE is_active=true ORDER BY id;";
    const { rows } = await runSql(sql, []);
    let allGroups = [];

    rows.forEach((row) => allGroups.push({ ...row, stackItems: true }));

    return allGroups;
  } catch (error) {
    console.log(error);
  }
};

// returns false if Group already exists and true if group is created
const createGroup = async (newGroup, groupDuration, payRate) => {
  let group_title = newGroup
    .split(" ")
    .map((word) => word[0].toUpperCase() + word.substring(1))
    .join(" ");
  let group_duration = Number(groupDuration);
  let pay_rate = Number(payRate);
  let result = false;
  try {
    const sql = "Select * FROM groups WHERE title=$1 and is_active=true;";
    const { rows } = await runSql(sql, [group_title]);
    if (rows.length === 0) {
      try {
        const newSQL =
          "Insert INTO groups (title,group_duration,pay_rate) VALUES ($1,$2,$3);";
        const response = await runSql(newSQL, [
          group_title,
          group_duration,
          pay_rate,
        ]);
        // console.log({ response });
        result = true;
      } catch (error) {
        console.log(error);
      }
    }

    return result;
  } catch (error) {
    console.log(error);
  }
};

const editGroup = async (id, title, duration, payRate) => {
  let result = false;
  let group_title = title
    .split(" ")
    .map((word) => word[0].toUpperCase() + word.substring(1))
    .join(" ");
  try {
    const sql =
      "Update groups SET title=$1, group_duration=$2, pay_rate=$3 WHERE id=$4;";
    const { rows } = await runSql(sql, [
      group_title,
      Number(duration),
      Number(payRate),
      Number(id),
    ]);
    result = true;
  } catch (error) {
    console.log(error);
  }
  return result;
};

const deleteGroup = async (id) => {
  let result = false;
  try {
    const sql = "Update groups SET is_active=FALSE WHERE id=$1;";
    const { rows } = await runSql(sql, [Number(id)]);
    result = true;
  } catch (error) {
    console.log(error);
  }
  return result;
};

module.exports = {
  getAllGroups,
  createGroup,
  editGroup,
  deleteGroup,
};

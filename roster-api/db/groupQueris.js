const { runSql } = require("./queries");
const moment = require("moment");
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

const createRoster = async (weekNumber) => {
  try {
    const sql =
      "INSERT INTO roster(title,start_date,end_date,week_number,status,shift_id,phol_id) VALUES ('From Api','2020-08-24','2020-08-30',$1,'Open',1,1);";
    const params = [weekNumber];
    await runSql(sql, params);
  } catch (error) {
    console.log(error);
  }
};

const addShifts = async (shifts) => {
  // INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,staff_id) VALUES (1599444000000,1599454800000,FALSE,6);
  for (let i = 0; i < shifts.length; i++) {
    const shift = shifts[i];
    try {
      const sql =
        "INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,staff_id)VALUES ($1,$2,FALSE,$3)";
      const params = [shift.start_time, shift.end_time, shift.staffId];
      await runSql(sql, params);
    } catch (error) {
      console.log(error);
    }
  }
};

module.exports = {
  getAllGroups,
  createRoster,
  addShifts,
};

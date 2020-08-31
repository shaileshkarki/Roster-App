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
      "INSERT INTO roster(title,start_date,end_date,week_number,status) VALUES ('From Api','2020-08-24','2020-08-30',$1,'Open');";
    const params = [weekNumber];
    const results = await runSql(sql, params);
  } catch (error) {
    console.log(error);
  }

  try {
    const sql2 = "SELECT roster_id from roster WHERE week_number = $1";
    const params2 = [weekNumber];
    const { rows } = await runSql(sql2, params2);
    console.log(rows[0].roster_id);
    return rows[0];
  } catch (error) {
    console.log(error);
  }
};

const addShifts = async (rosterId, shifts) => {
  // INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,staff_id) VALUES (1599444000000,1599454800000,FALSE,6);

  for (let i = 0; i < shifts.length; i++) {
    const shift = shifts[i];
    try {
      const sql =
        "INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,staff_id,roster_id)VALUES ($1,$2,FALSE,$3,$4)";
      const params = [
        moment(shift.start_time).unix(),
        moment(shift.end_time).unix(),
        shift.staffId,
        rosterId,
      ];
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

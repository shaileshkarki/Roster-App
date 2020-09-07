const { runSql } = require("./queries");
const {
  convertStringDateToMilliseconds,
  convertMillisecondsToLocalTime,
  convertMillisecondsToDate,
  calculateBreak,
  calculateShiftDurationExcludingBreak,
} = require("../lib/roster");

const moment = require("moment");

const getRoster = async (roster_id = 1) => {
  // let startDate = convertStringDateToMilliseconds(rosterStartDate).toString();
  // let endDate = convertStringDateToMilliseconds(rosterEndDate).toString();
  let rosterID = Number(roster_id);
  const sql =
    "select roster.title,start_date,end_date,week_number,timeslot_from,timeslot_to,username from roster, shifts, staff where shifts.roster_id = roster.roster_id and shifts.staff_id=staff.staff_id and roster.roster_id=$1 and shifts.isallocated = true;";
  const params = [rosterID];
  let weekStart;
  let weekEnd;
  let rosterDaysArr = [];
  try {
    const { rows } = await runSql(sql, params);
    // console.log("rows", rows);
    weekStart = new Date(rows[0].start_date);
    weekEnd = new Date(rows[0].end_date);
    let rosterPeriod = (weekEnd - weekStart) / 1000 / 60 / 60 / 24;
    rosterDaysArr = [];
    let total = {};
    for (let i = 0; i <= rosterPeriod; i++) {
      let nextDay = new Date(weekStart);
      // let temp = {};
      nextDay.setDate(nextDay.getDate() + i);
      total[nextDay.toDateString()] = 0;
      // total[i] = temp;
      rosterDaysArr.push(nextDay.toDateString());
    }

    console.log("total", total);
    // console.log("rosterDaysArr", rosterDaysArr);
    let data = {};
    rows.forEach((row, index) => {
      let shiftDate = convertMillisecondsToDate(row.timeslot_from * 1000);
      if (rosterDaysArr.includes(shiftDate)) {
        let shift = {};
        shift["start_time"] = convertMillisecondsToLocalTime(
          Number(row.timeslot_from) * 1000
        );
        shift["end_time"] = convertMillisecondsToLocalTime(
          Number(row.timeslot_to) * 1000
        );
        shift["break_length"] = calculateBreak(
          row.timeslot_from,
          row.timeslot_to
        );
        shift["shift_duration"] = calculateShiftDurationExcludingBreak(
          row.timeslot_from * 1000,
          row.timeslot_to * 1000
        );
        shift["week_start"] = row.start_date;
        shift["week_end"] = row.end_date;
        shift["username"] = row.username;
        shift["work_date"] = convertMillisecondsToDate(
          row.timeslot_from * 1000
        );

        weekStart = shift["week_start"];
        weekEnd = shift["week_end"];

        if (Object.keys(data).includes(row.username)) {
          data[row.username].push(shift);
        } else {
          data[row.username] = [shift];
        }
      }
    });

    // weekStart = new Date(weekStart);
    // weekEnd = new Date(weekEnd);
    // let rosterPeriod = (weekEnd - weekStart) / 1000 / 60 / 60 / 24;
    // let rosterDaysArr = [];
    // for (let i = 0; i <= rosterPeriod; i++) {
    //   let nextDay = new Date(weekStart);
    //   nextDay.setDate(nextDay.getDate() + i);
    //   rosterDaysArr.push(nextDay.toDateString());
    // }

    Object.keys(data).forEach((staff, index1) => {
      // let rosterDay = [];
      // let rost;
      let match = false;
      rosterDaysArr.forEach((day, index3) => {
        data[staff].forEach((shift, index2) => {
          if (shift.work_date === day) {
            match = true;
            total[day] += shift.shift_duration;
            // Object.keys(total).map((rosterDayTotal, index) => {
            //   if (rosterDayTotal == day) {
            //     total[index][day] += shift.shift_duration;
            //     console.log("total[index][day]", total[index][day]);
            //   }
            // });
          }
        });
        if (match === false) {
          let blankShift = {
            start_time: "",
            end_time: "",
            break_length: 0,
            shift_duration: 0,
            week_start: "",
            week_end: "",
            username: "",
            work_date: "",
          };
          blankShift.week_start = weekStart;
          blankShift.week_end = weekEnd;
          blankShift.work_date = day;
          blankShift.username = staff;
          data[staff].unshift(blankShift);
        }
      });
    });
    // console.log("total", total);
    //sorting shifts according to dates in ascending order
    // console.log(Object.keys(data));
    Object.keys(data).forEach((staff) => {
      data[staff].sort((a, b) =>
        Date(a.work_date) < Date(b.work_date) ? -1 : 1
      );
    });

    // Object.keys(data).forEach((staff) => {
    //   data[staff].filter((shift, index) => {
    //     if (!rosterDaysArr.includes(shift.work_date)) {
    //       data[staff].splice(index, 1);
    //     }
    //   });
    // });
    let dataArray = [];
    dataArray.push(data);
    dataArray.push(total);
    // console.log(dataArray);
    return dataArray;
  } catch (e) {
    console.log("Error while quering database: ", e);
  }
};

const getAllRosterWeeks = async () => {
  try {
    const sql = "select * from roster ORDER BY week_number DESC;";
    const { rows } = await runSql(sql, []);
    let allRosters = [];
    rows.forEach((row) => allRosters.push(row));

    return allRosters;
  } catch (error) {
    console.log(error);
  }
};

const createRoster = async (weekNumber, title, startDate, endDate) => {
  try {
    const sql = `INSERT INTO roster(title,start_date,end_date,week_number,status) VALUES ($1,$2,$3,$4,'Open');`;
    const params = [title, startDate, endDate, weekNumber];
    const results = await runSql(sql, params);
  } catch (error) {
    console.log(error);
  }
  try {
    return await getRosterIdFromWeekNumber(weekNumber);
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
        "INSERT INTO shifts(timeslot_from,timeslot_to,isallocated,staff_id,roster_id, group_id, title)VALUES ($1,$2,$3,$4,$5,$6,$7)";
      const params = [
        moment(shift.start_time).unix(),
        moment(shift.end_time).unix(),
        shift.isallocated,
        shift.staff_id,
        rosterId,
        shift.group,
        shift.title,
      ];
      console.log(params[0], moment(params[1]));
      await runSql(sql, params);
    } catch (error) {
      console.log(error);
    }
  }
};
const getRosterIdFromWeekNumber = async (weekNumber) => {
  try {
    const sql = "SELECT roster_id from roster WHERE week_number = $1";
    const params = [weekNumber];
    const { rows } = await runSql(sql, params);
    // console.log(rows[0].roster_id);
    return rows[0].roster_id;
  } catch (error) {
    console.log(error);
  }
};

const updateShifts = async (weekNumber, shifts) => {
  const oldShifts = await getShiftsForWeekNumber(weekNumber);
  const rosterId = await getRosterIdFromWeekNumber(weekNumber);
  // console.log(oldShifts);
  for (let i = 0; i < oldShifts.length; i++) {
    try {
      const sql = "UPDATE shifts SET isallocated = false where shift_id = $1";
      const params = [oldShifts[i].shift_id];
      await runSql(sql, params);
    } catch (error) {
      console.log(error);
    }
  }

  try {
    await addShifts(rosterId, shifts);
  } catch (error) {
    console.log(error);
  }

  // console.log(oldShifts);
  // for (let i = 0; i < shifts.length; i++) {
  //   let match = false;
  //   for (let x = 0; x < oldShifts.length; x++) {
  //     if (shifts[i].shift_id === oldShifts[x].shift_id) {
  //       match = true;

  //       const sql =
  //         "UPDATE shifts SET timeslot_from = $1, timeslot_to =$2, isallocated = $3 ,staff_id =$4, group_id = $5, title = $6 WHERE shift_id = $7;";

  //       const params = [
  //         moment(shifts[i].start_time).unix(),
  //         moment(shifts[i].end_time).unix(),
  //         shifts[i].isallocated,
  //         shifts[i].staffId,
  //         shifts[i].group,
  //         shifts[i].title,
  //         shifts[i].shift_id,
  //       ];
  //       await runSql(sql, params);
  //     }
  //   }

  //   if (!match) {
  //     await addShifts(weekNumber, shifts[i]);
  //   }
  // }
};

const getCurrentWeekNumber = async () => {
  const sql =
    "SELECT week_number  FROM roster ORDER BY week_number DESC LIMIT 1;";

  const params = [];
  try {
    const { rows } = await runSql(sql, params);
    return rows[0].week_number + 1;
  } catch (error) {
    console.log(error);
  }
};

const getRosterWeeks = async () => {
  const sql = "SELECT week_number from roster ORDER BY week_number DESC;";
  params = [];
  try {
    const weeks = await runSql(sql, params);
    return weeks;
  } catch (error) {
    console.log(error);
  }
};

const getShiftsForWeekNumber = async (weekNumber) => {
  try {
    const rosterId = await getRosterIdFromWeekNumber(weekNumber);
    const sql =
      "Select * from shifts where roster_id = $1 AND isallocated = true;";
    const params = [rosterId];
    const { rows } = await runSql(sql, params);
    let results = [];

    rows.forEach((row) => {
      // moment(shifts[i].start_time).unix()
      row.start_time = row.timeslot_from;
      row.end_time = row.timeslot_to;
      row.group = row.group_id;
      results.push(row);
      console.log("time slot from = ", row.timeslot_from);
    });
    return results;
  } catch (error) {
    console.log(error);
  }
};

const getRosterPeriod = async (rosterId) => {
  const sql =
    "SELECT start_date , end_date, title FROM roster where roster_id = $1;";
  const params = [rosterId];
  const rosterPeriod = await runSql(sql, params);
  console.log(rosterPeriod.rows);
  let a = new Date(rosterPeriod.rows[0].start_date);
  console.log("Date " + a.toDateString());
  return rosterPeriod.rows;
};

module.exports = {
  getRoster,
  getAllRosterWeeks,
  createRoster,
  addShifts,
  getCurrentWeekNumber,
  getRosterWeeks,
  getShiftsForWeekNumber,
  updateShifts,
  getRosterIdFromWeekNumber,
  getRosterPeriod,
};

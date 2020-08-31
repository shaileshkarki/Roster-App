const { runSql } = require("./queries");
const {
  convertStringDateToMilliseconds,
  convertMillisecondsToLocalTime,
  convertMillisecondsToDate,
  calculateBreak,
  calculateShiftDurationExcludingBreak,
} = require("../lib/roster");
const getRoster = async (week_Number = 1) => {
  // let startDate = convertStringDateToMilliseconds(rosterStartDate).toString();
  // let endDate = convertStringDateToMilliseconds(rosterEndDate).toString();
  let weekNumber = Number(week_Number);
  const sql =
    "select title,start_date,end_date,week_number,timeslot_from,timeslot_to,username from roster, shifts, staff where shifts.roster_id = roster.roster_id and shifts.staff_id=staff.staff_id and roster.week_number=$1;";
  const params = [weekNumber];
  var weekStart;
  var weekEnd;
  try {
    console.log("rows");
    const { rows } = await runSql(sql, params);

    let data = {};
    rows.forEach((row, index) => {
      let shift = {};
      shift["start_time"] = convertMillisecondsToLocalTime(row.timeslot_from);
      shift["end_time"] = convertMillisecondsToLocalTime(row.timeslot_to);
      shift["break_length"] = calculateBreak(
        row.timeslot_from,
        row.timeslot_to
      );
      shift["shift_duration"] = calculateShiftDurationExcludingBreak(
        row.timeslot_from,
        row.timeslot_to
      );
      shift["week_start"] = row.start_date;
      shift["week_end"] = row.end_date;
      shift["username"] = row.username;
      shift["work_date"] = convertMillisecondsToDate(row.timeslot_from);

      weekStart = shift["week_start"];
      weekEnd = shift["week_end"];

      if (Object.keys(data).includes(row.username)) {
        data[row.username].push(shift);
      } else {
        data[row.username] = [shift];
      }
    });

    weekStart = new Date(weekStart);
    weekEnd = new Date(weekEnd);
    let rosterPeriod = (weekEnd - weekStart) / 1000 / 60 / 60 / 24;
    let rosterDaysArr = [];
    for (let i = 0; i <= rosterPeriod; i++) {
      let nextDay = new Date(weekStart);
      nextDay.setDate(nextDay.getDate() + i);
      rosterDaysArr.push(nextDay.toDateString());
    }

    Object.keys(data).forEach((staff, index1) => {
      let match = false;
      rosterDaysArr.forEach((day, index3) => {
        data[staff].forEach((shift, index2) => {
          if (shift.work_date === day) {
            match = true;
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

    //sorting shifts according to dates in ascending order
    console.log(Object.keys(data));
    Object.keys(data).forEach((staff) => {
      data[staff].sort((a, b) =>
        Date(a.work_date) < Date(b.work_date) ? -1 : 1
      );
    });

    console.log(data);

    return data;
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
module.exports = {
  getRoster,
  getAllRosterWeeks,
};

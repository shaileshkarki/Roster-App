const { runSql } = require("./queries");
const { convertStringDateToMilliseconds } = require("../lib/roster");

const getRoster = async (
  rosterStartDate,
  rosterEndDate,
  status = "Finalised"
) => {
  let startDate = convertStringDateToMilliseconds(rosterStartDate).toString();
  let endDate = convertStringDateToMilliseconds(rosterEndDate).toString();
  console.log({ startDate }, { endDate });
  const sql =
    "select title,start_date,end_date,week_number,timeslot_from,timeslot_to,username from roster, shifts, staff where roster.shift_id = shifts.shift_id and shifts.staff_id=staff.staff_id and roster.week_number=1 and roster.status='Finalised';";
  /* "select firstname, status, week_number, timeslot_from, timeslot_to, start_date, end_date from roster, shifts, staff where roster.shift_id = shifts.shift_id and shifts.staff_id=staff.staff_id and roster.status='Finalised' order by week_number;";*/
  /* "select * from roster, shifts, staff where roster.shift_id = shifts.shift_id and shifts.staff_id=staff.staff_id and shifts.timeslot_from <= $1 and shifts.timeslot_from >= $2 and roster.status=$3;";
   const params = [startDate, endDate, status];*/
  const params = [];
  try {
    // console.log("rows");
    const { rows } = await runSql(sql, params);
    // console.log({ rows });
    let shiftsForStaffMember = [];
    let allShifts = []; //outer array
    let names = [];
    let data = {};
    rows.forEach((row, index) => {
      let shift = {};
      shift["start_time"] = row.timeslot_from;
      shift["end_time"] = row.timeslot_to;
      shift["week_start"] = row.start_date;
      shift["week_end"] = row.end_date;
      shift["username"] = row.username;
      if (Object.keys(data).includes(row.username)) {
        data[row.username].push(shift);
      } else {
        data[row.username] = [shift];
        // data[row.username].push(shift);
      }
      // console.log({ shift });
      // if (allShifts.length === 0) {
      //   allShifts.push({ name: row.username, shifts: [] });
      // }

      // for(let i = 0; i<allShifts.length; i++) {
      //   if (allShifts[i].name == row.username) {
      //     // add shifts to the array
      //     console.log("need to add shifts");
      //   } else {

      //     // if name does not match we have to add the name
      //     allShifts.push({ name: row.username, shifts: [] });
      //     //need to add shifts
      //   }
      // };
    });
    // console.log({ data });
    // let  allShifts = [
    //   {
    //     name: "john",
    //     shifts: [
    //       {
    //         startTime: "11:00",
    //         endTime: "5:00",
    //         date: "26 Aug 2020",
    //       },
    //       {
    //         startTime: "11:00",
    //         endTime: "5:00",
    //         date: "26 Aug 2020",
    //       },
    //       {
    //         startTime: "11:00",
    //         endTime: "5:00",
    //         date: "26 Aug 2020",
    //       },
    //     ],
    //   },
    //   {
    //     name: "sam",
    //     shifts: [
    //       {
    //         startTime: "11:00",
    //         endTime: "5:00",
    //         date: "26 Aug 2020",
    //       },
    //       {
    //         startTime: "11:00",
    //         endTime: "5:00",
    //         date: "26 Aug 2020",
    //       },
    //       {
    //         startTime: "11:00",
    //         endTime: "5:00",
    //         date: "26 Aug 2020",
    //       },
    //     ],
    //   },
    // ];
    // console.log(data[1].name);
    // console.log(data[1].shifts);
    return data;
  } catch (e) {
    console.log("Error while quering database: ", e);
  }
};
// [{john:[shift1,shift2,shift3....shift]},{nick:[shift1,shift2,shift3,shift]}]

module.exports = {
  getRoster,
};
//convertStringDateToMilliseconds(rosterStartDate),
// convertStringDateToMilliseconds(rosterEndDate),
// status,
/*select * from roster, shifts, staff where roster.shift_id = shifts.shift_id and shifts.staff_id=staff.staff_id and roster.roster_id=1 roster.status='Finalised';
 */ //1598227200000  1598745600000
//  select * from roster, shifts, staff where roster.shift_id = shifts.shift_id and shifts.staff_id=staff.staff_id and shifts.timeslot_from <= '1598227200000' and shifts.timeslot_from >= '1598227200000' and roster.status='Finalised';

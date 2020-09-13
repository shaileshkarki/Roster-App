// GJ: this module will obtain the necessary record set from the database concerning wages
const { runSql } = require("./queries");
const axios = require("axios");

// INSERT QUERIES BELOW WHEN READY
//
//

// GJ: The query below establishes the weekly pay for Roster ID 1 by person
const getTotalRosterOneWages = async () => {
    try {
        const sql =
            "select shifts.staff_id, username, groups.title, pay_rate, SUM((timeslot_to - timeslot_from) / 3600) AS hours_worked, SUM(((timeslot_to - timeslot_from) / 3600) * pay_rate) AS total_shift_pay from shifts, groups, staff WHERE shifts.roster_id=1 AND shifts.group_id = groups.id AND shifts.staff_id = staff.staff_id GROUP BY shifts.staff_id, username, groups.title, pay_rate ORDER BY shifts.staff_id;";
        const { rows } = await runSql(sql, []);
        let totalRosterOneWages = [];
        rows.forEach((row) => totalRosterOneWages.push(row));

        //console.log(totalRosterOneWages);

        return totalRosterOneWages;
    } catch (error) {
        console.log(error);
    }
};

// GJ: This query is to obtain the wages for the speficed roster it parameter. i.e week1, week 2 etc.
const getDesiredWeekWages = async (desired_week_number) => {
    try {
        const sql =
            "select shifts.roster_id, username, timeslot_from, timeslot_to, groups.title, pay_rate, SUM((timeslot_to - timeslot_from) / 3600) AS rostered_hours from shifts, groups, staff WHERE shifts.roster_id=$1 AND shifts.group_id = groups.id AND shifts.staff_id = staff.staff_id GROUP BY shifts.roster_id, username, timeslot_from, timeslot_to, groups.title, pay_rate ORDER BY username, timeslot_from;";

        // "select shifts.roster_id, username, timeslot_from, timeslot_to, groups.title, pay_rate, SUM((timeslot_to - timeslot_from) / 3600) AS rostered_hours from shifts, groups, staff WHERE shifts.roster_id=1 AND shifts.group_id = groups.id AND shifts.staff_id = staff.staff_id GROUP BY shifts.roster_id, username, timeslot_from, timeslot_to, groups.title, pay_rate ORDER BY username, timeslot_from;";

        // SQL paramater must be an array
        const params = [desired_week_number];
        const { rows } = await runSql(sql, params);
        let totalDesiredWeekWages = [];
        rows.forEach((row) => totalDesiredWeekWages.push(row));
        //console.log("THE DESIRED WEEK TOTAL WAGES FOR EACH PERSON");
        //console.log(totalDesiredWeekWages);

        return totalDesiredWeekWages;
    } catch (error) {
        console.log(error);
    }
};

// GJ: This query obtains the weekly wages by job title. It is used for the PDF report
const getDesiredWeekJobWages = async (desired_week_number) => {
    try {
        const sql =
            // "select shifts.roster_id, groups.title, pay_rate, SUM((timeslot_to - timeslot_from) / 3600) AS hours_worked, SUM(((timeslot_to - timeslot_from) / 3600) * pay_rate) AS total_shift_pay from shifts, groups, staff WHERE shifts.roster_id=$1 AND shifts.group_id = groups.id AND shifts.staff_id = staff.staff_id GROUP BY shifts.roster_id, groups.title, pay_rate ORDER BY groups.title;";

            "select shifts.roster_id, SUM((timeslot_to - timeslot_from) / 3600) AS rostered_hours, groups.title, pay_rate from shifts, groups WHERE shifts.roster_id=$1 AND shifts.group_id = groups.id GROUP BY timeslot_to, shifts.roster_id, groups.title, pay_rate ORDER BY groups.title;";

        // SQL paramater must be an array
        const params = [desired_week_number];
        const { rows } = await runSql(sql, params);
        let totalDesiredWeekJobWages = [];
        rows.forEach((row) => totalDesiredWeekJobWages.push(row));
        //console.log("THE DESIRED WEEK TOTAL WAGES FOR EACH TITLE IS");
        //console.log(totalDesiredWeekJobWages);

        return totalDesiredWeekJobWages;
    } catch (error) {
        console.log(error);
    }
};

// GJ: The query below shows the wages for 24/08/2020.
const getSpecificDayWages = async () => {
    try {
        const sql =
            "select shift_start_date, SUM((timeslot_to - timeslot_from) / 3600) AS hours_worked, SUM(((timeslot_to - timeslot_from) / 3600) * pay_rate) AS total_shift_pay, shifts.staff_id, username, shifts.group_id, groups.title from shifts, groups, staff  WHERE shift_start_date='2020-08-24' AND shifts.group_id = groups.id AND shifts.staff_id = staff.staff_id GROUP BY shift_start_date, shifts.staff_id, username, shifts.group_id, groups.title;";
        const { rows } = await runSql(sql, []);
        let totalRosterOneWages = [];
        rows.forEach((row) => totalRosterOneWages.push(row));

        console.log(totalRosterOneWages);

        return totalRosterOneWages;
    } catch (error) {
        console.log(error);
    }
};

const getUniqueRoles = async () => {
    try {
        const sql = "SELECT * from groups;";
        const { rows } = await runSql(sql, []);
        let allUniqueRoles = [];
        rows.forEach((row) => allUniqueRoles.push(row));

        //console.log(allUniqueRoles);

        return allUniqueRoles;
    } catch (error) {
        console.log(error);
    }
};

// GJ: THE BLEOW ROUTE SHOWS THE WEEKLY WAGES PAID BY ROSTER ID, PER PERSON PER ROLE
// The below is used for the main table on the WAGES
const getEachRosterWeekWagesByEachPersonAndRole = async () => {
    try {
        const sql =
            "select shifts.roster_id, username, groups.title, pay_rate, SUM((timeslot_to - timeslot_from) / 3600) AS hours_worked, SUM(((timeslot_to - timeslot_from) / 3600) * pay_rate) AS total_shift_pay from shifts, groups, staff WHERE shifts.group_id = groups.id AND shifts.staff_id = staff.staff_id  GROUP BY shifts.roster_id, username, groups.title, pay_rate ORDER BY shifts.roster_id;";
        const { rows } = await runSql(sql, []);
        let alleachRosterWeekWagesByEachPersonAndRole = [];
        rows.forEach((row) =>
            alleachRosterWeekWagesByEachPersonAndRole.push(row)
        );
        // console.log("eACH WEEK FOR USERNAME WAGES IS");
        // console.log(alleachRosterWeekWagesByEachPersonAndRole);

        return alleachRosterWeekWagesByEachPersonAndRole;
    } catch (error) {
        console.log(error);
    }
};

const getWagesByDesiredUsername = async (desired_username) => {
    try {
        const sql =
            "select shifts.roster_id, username, groups.title, pay_rate, SUM((timeslot_to - timeslot_from) / 3600) AS rostered_hours from shifts, groups, staff WHERE shifts.group_id = groups.id AND shifts.staff_id = staff.staff_id AND username=$1 GROUP BY shifts.roster_id, username, timeslot_from, timeslot_to, groups.title, pay_rate ORDER BY shifts.roster_id;";
        const params = [desired_username];
        const { rows } = await runSql(sql, params);
        let allWagesByDesiredUsername = [];
        rows.forEach((row) => allWagesByDesiredUsername.push(row));
        console.log("eACH WEEK FOR USERNAME WAGES IS");
        console.log(allWagesByDesiredUsername);

        return allWagesByDesiredUsername;
    } catch (error) {
        console.log(error);
    }
};

// GJ: This just obtains a list of all usernames from staff
const getAllUsernames = async () => {
    try {
        const sql = "SELECT username from staff;";
        const { rows } = await runSql(sql, []);
        let allUsernames = [];
        rows.forEach((row) => allUsernames.push(row));

        //console.log(allUsernames);

        return allUsernames;
    } catch (error) {
        console.log(error);
    }
};

module.exports = {
    getTotalRosterOneWages,
    getSpecificDayWages,
    getUniqueRoles,
    getEachRosterWeekWagesByEachPersonAndRole,
    getDesiredWeekWages,
    getDesiredWeekJobWages,
    getAllUsernames,
    getWagesByDesiredUsername,
};

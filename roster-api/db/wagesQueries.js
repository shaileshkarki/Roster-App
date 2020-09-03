// GJ: this module will obtain the necessary record set from the database concerning wages
const { runSql } = require("./queries");
const axios = require("axios");

// INSERT QUERIES BELOW WHEN READY

const getTotalRosterOneWages = async () => {
    try {
        const sql =
            "select shifts.staff_id, firstname, groups.title, pay_rate, SUM((timeslot_to - timeslot_from) / 3600) AS hours_worked, SUM(((timeslot_to - timeslot_from) / 3600) * pay_rate) AS total_shift_pay from shifts, groups, staff WHERE shifts.roster_id=1 AND shifts.group_id = groups.id AND shifts.staff_id = staff.staff_id GROUP BY shifts.staff_id, firstname, groups.title, pay_rate ORDER BY shifts.staff_id;";
        const { rows } = await runSql(sql, []);
        let totalRosterOneWages = [];
        rows.forEach((row) => totalRosterOneWages.push(row));

        console.log(totalRosterOneWages);

        return totalRosterOneWages;
    } catch (error) {
        console.log(error);
    }
};

module.exports = { getTotalRosterOneWages };

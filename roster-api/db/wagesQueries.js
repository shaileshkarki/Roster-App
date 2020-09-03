// GJ: this module will obtain the necessary record set from the database concerning wages
const { runSql } = require("./queries");

// INSERT QUERIES BELOW WHEN READY

const getWagesByWeek = async () => {
    try {
        const sql = "SELECT * FROM publicholidays;";
        const { rows } = await runSql(sql, []);
        let allWageInfo = [];
        rows.forEach((row) => allWageInfo.push(row));

        return allWageInfo;
    } catch (error) {
        console.log(error);
    }
};

module.exports = getWagesByWeek;

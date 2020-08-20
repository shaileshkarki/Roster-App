const { runSql } = require("./queries");

// query to select all public holidays
const getAllPublicHolidays = async () => {
    const sql = "Select * FROM publicholidays;";
    const { rows } = await runSql(sql, []);
    let allPublicHolidays = [];
    rows.forEach((row) => allPublicHolidays.push(row));

    return allPublicHolidays;
};

// write a query to delete all public allPublicHolidays

// write a query to update the table

module.exports = {
    getAllPublicHolidays
};

const { runSql } = require("./queries");

// query to select all public holidays
const getAllPublicHolidays = async () => {
    const sql = "SELECT * FROM publicholidays;";
    const { rows } = await runSql(sql, []);
    let allPublicHolidays = [];
    rows.forEach((row) => allPublicHolidays.push(row));

    console.log(allPublicHolidays);
    return allPublicHolidays;
};

// write a query to delete all public allPublicHolidays

// write a query to update the table

module.exports = {
    getAllPublicHolidays,
};

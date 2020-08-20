const { runSql } = require("./queries");
const axios = require("axios");

// query to select all public holidays
const getAllPublicHolidays = async () => {
    try {
        const sql = "Select * FROM publicholidays;";
        const { rows } = await runSql(sql, []);
        let allPublicHolidays = [];
        rows.forEach((row) => allPublicHolidays.push(row));

        return allPublicHolidays;
    } catch (error) {
        console.log(error);
    }
};

// write a query to delete all public allPublicHolidays
const getPublicHolidaysFromAPI = async () => {
    let allPublicHolidays = [];

    const baseURL2020 =
        "https://data.gov.au/data/api/3/action/datastore_search?resource_id=c4163dc4-4f5a-4cae-b787-43ef0fcf8d8b&limit=120";

    const baseURL2021 =
        "https://data.gov.au/data/api/3/action/datastore_search?resource_id=2dee10ef-2d0c-44a0-a66b-eb8ce59d9110&limit=120";

    const baseURL2022 =
        "https://data.gov.au/data/api/3/action/datastore_search?resource_id=d256f989-8f49-46eb-9770-1c6ee9bd2661&limit=120";

    try {
        const response = await axios.get(baseURL2020);
        if (response.status === 200) {
            //console.log(response.statusText);
            allPublicHolidays = response.data.result.records;

            console.log("The length is: " + allPublicHolidays.length);
        }
    } catch (error) {
        console.log("DID NOT WORK");
    }
    return allPublicHolidays;
};

const updatePublicHolidays = async (allPublicHolidays) => {
    // insert the data into the database
    try {
        for (i = 0; i < allPublicHolidays.length; i++) {
            // assign a make shorter the name
            var phol = allPublicHolidays[i];

            const sql =
                "INSERT INTO publicholidays (phol_state, phol_date, phol_name) VALUES ($1,$2,$3);";
            const params = [phol.Jurisdiction, phol.Date, phol["Holiday Name"]];
            console.log("CHECKING DATA: " + i);
            const { rows } = await runSql(sql, params);
        }
    } catch (error) {
        console.log(error);
    }

    return allPublicHolidays;
};

const synchronisePublicHolidays = async () => {
    // now co-ordinate the retrieval and inserting of teh public holiday dates
    let allPublicHolidays = [];

    try {
        // obtain the api info first
        allPublicHolidays = await getPublicHolidaysFromAPI();

        // now update the database with
        await updatePublicHolidays(allPublicHolidays);
    } catch (error) {
        console.log(error);
    }
};

// write a query to update the table

module.exports = {
    getAllPublicHolidays,
    synchronisePublicHolidays,
};

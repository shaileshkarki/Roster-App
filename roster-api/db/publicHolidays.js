const { runSql } = require("./queries");
const axios = require("axios");

// query to select all public holidays  from the database
const getAllPublicHolidays = async () => {
    try {
        const sql = "SELECT * FROM publicholidays;";
        const { rows } = await runSql(sql, []);
        let allPublicHolidays = [];
        rows.forEach((row) => allPublicHolidays.push(row));

        return allPublicHolidays;
    } catch (error) {
        console.log(error);
    }
};

// write a query to delete all public allPublicHolidays
const getPublicHolidaysFromAPI = async (baseURL) => {
    let allPublicHolidays = [];

    try {
        // const response = await axios.get(baseURL2022);
        const response = await axios.get(baseURL);
        if (response.status === 200) {
            //console.log(response.statusText);
            allPublicHolidays = response.data.result.records;

            console.log("The length is: " + allPublicHolidays.length);
        }
    } catch (error) {
        console.log("Fetching holidays from the API did not work");
    }
    return allPublicHolidays;
};

const updatePublicHolidays = async (allPublicHolidays) => {
    // insert the data into the database
    try {
        for (i = 0; i < allPublicHolidays.length; i++) {
            // assign a make shorter the name
            var phol = allPublicHolidays[i];

            console.log(phol);

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
    // declare API link
    let allPublicHolidays = [];

    // combine 2020, 2021, 2022 API links into an array ready for looping through
    var baseURL = [
        "https://data.gov.au/data/api/3/action/datastore_search?resource_id=c4163dc4-4f5a-4cae-b787-43ef0fcf8d8b&limit=120",
        "https://data.gov.au/data/api/3/action/datastore_search?resource_id=2dee10ef-2d0c-44a0-a66b-eb8ce59d9110&limit=120",
        "https://data.gov.au/data/api/3/action/datastore_search?resource_id=d256f989-8f49-46eb-9770-1c6ee9bd2661&limit=120",
    ];

    // for each API Calendar link...obtain API data, ensure Holiday Key is standard and then call a function to insert into the database
    for (var loopIterator = 0; loopIterator < baseURL.length; loopIterator++) {
        try {
            //console.log("INSERTING", loopIterator);
            // obtain the api info first
            allPublicHolidays = await getPublicHolidaysFromAPI(
                baseURL[loopIterator]
            );
            // the below code is cater for the differing API headings concerning "Holiday Name" & "Holiday_Name"
            // Year 2020 & 2021 API use 'Holiday Name'. Year 2022 uses "Holiday Name"

            // Loop through each API record. If the object key is 'Holiday Name'...leave as it
            // ELSE,rename the Object Key from 'Holiday_Name' to 'Holiday Name' and re-assign back to the "allPublicHolidays" before DB insertion
            for (var i = 0; i < allPublicHolidays.length; i++) {
                // console.log(allPublicHolidays[i].Date);
                // If the
                if (allPublicHolidays[0].hasOwnProperty("Holiday Name")) {
                    // console.log("Yippee");
                } else {
                    // console.log("Nay");
                    let newObjects = allPublicHolidays.map((obj) => {
                        return {
                            Date: obj.Date,
                            "Holiday Name": obj["Holiday_Name"],
                            Information: obj.Information,
                            Jurisdiction: obj.Jurisdiction,
                        };
                    });
                    allPublicHolidays = newObjects;
                }
                allPublicHolidays;
            }

            // now update the database with the correct API data.
            await updatePublicHolidays(allPublicHolidays);
        } catch (error) {
            console.log(error);
        }
    }

    // try {
    //     // obtain the api info first
    //     allPublicHolidays = await getPublicHolidaysFromAPI();

    //     // now update the database with
    //     await updatePublicHolidays(allPublicHolidays);
    // } catch (error) {
    //     console.log(error);
    // }
};

// write a query to update the table

module.exports = {
    getAllPublicHolidays,
    synchronisePublicHolidays,
};

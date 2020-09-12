// this module calculates the headings required for each report

const calculateHeadings = (dataObject) => {
    const tableHeader = [];

    // just assign the object record to be used to ascertain the headings for the table
    let first_record = {};
    if (dataObject.length > 0) {
        first_record = dataObject[0];
    }

    // now obtain the table header headings to display on the report
    // use the first object's key's as the place to obtain headings
    console.log("*******************");
    for (const [key, value] of Object.entries(first_record)) {
        tableHeader.push(key);
    }

    return tableHeader;
};

export default calculateHeadings;

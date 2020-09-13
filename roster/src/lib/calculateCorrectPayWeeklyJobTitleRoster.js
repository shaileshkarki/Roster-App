// GJ: This modules take the data object from the WEEKLY WAGE BY JOB TITLE , and calculates the correct pay

import calculateBreak from "./calculateBreak";

const calculatePay = (data) => {
    // copy the object
    // var clonedObject = Object.assign({}, data);
    // console.log(clonedObject);

    // just get a list of the usernames to aggregate hours and pay
    var temp_uniqueTitles = [];
    var objectLength = Object.keys(data).length;
    for (var i = 0; i < objectLength; i++) {
        temp_uniqueTitles.push(data[i].title);
    }
    // create a unique set that only contains 1 instance of a name
    var uniqueTitles = [...new Set(temp_uniqueTitles)];

    // declare some array variables to store the data
    var temp_rosteredHours = [];
    var temp_breakTimeHours = [];
    var temp_actualWorkTimeHours = [];
    var jt = [];
    var final_records = [];
    // for each unique name, loop through the data and take the roster id, usrname, title and calculate the running total of variious variables
    for (var j = 0; j < uniqueTitles.length; j++) {
        jt = [];
        for (var i = 0; i < objectLength; i++) {
            var counter = 0;
            if (data[i].title === uniqueTitles[j]) {
                if (counter === 0) {
                    jt.push(data[i].roster_id);
                    jt.push(data[i].title);
                    jt.push(Number(data[i].pay_rate));
                    jt = [...new Set(jt)];
                }
                // store each job title various metrics in an array
                temp_rosteredHours.push(Number(data[i].rostered_hours));
                temp_breakTimeHours.push(
                    Number(calculateBreak(data[i].rostered_hours))
                );
                temp_actualWorkTimeHours.push(
                    Number(
                        data[i].rostered_hours -
                            Number(calculateBreak(data[i].rostered_hours))
                    )
                );
                //console.log(temp_rosteredHours);
                //console.log(temp_breakTimeHours);
                // console.log(temp_actualWorkTimeHours);
                counter += 1;
            }
        }

        // now perform reduce to calculate running total of the 3 arrays above
        var totalRosteredHours = temp_rosteredHours.reduce(
            (total, currentValue) => {
                return total + currentValue;
            },
            0
        );
        // console.log(`temp_rosteredHours`, totalRosteredHours);

        var totalBreakTimeHours = temp_breakTimeHours.reduce(
            (total, currentValue) => {
                return total + currentValue;
            },
            0
        );
        //console.log(`temp_breakTimeHours`, totalBreakTimeHours);

        var totalActualWorkTimeHours = temp_actualWorkTimeHours.reduce(
            (total, currentValue) => {
                return total + currentValue;
            },
            0
        );
        // console.log(`temp_actualWorkTimeHours`, totalActualWorkTimeHours);

        //calculate actual pay_rate
        var totalPay = Math.round(jt[2] * totalActualWorkTimeHours * 100) / 100;

        // reset the arrays
        var temp_rosteredHours = [];
        var temp_breakTimeHours = [];
        var temp_actualWorkTimeHours = [];

        // push the required calculations in to the array

        jt.push(
            totalRosteredHours,
            totalBreakTimeHours,
            totalActualWorkTimeHours,
            totalPay
        );
        //console.log(jt);
        // jt = [...new Set(jt)];
        //console.log(jt);
        // establish the final array item for the person
        final_records.push(jt);
    }

    //console.log(final_records);
    // now create an object that replicate the data one but assigning each array item record to a key

    var newDataObject = final_records.map(function (item) {
        return {
            roster_id: item[0],
            title: item[1],
            pay_rate: "$" + item[2].toFixed(2),
            rostered_hours: item[3],
            breakTime: item[4],
            acutalWorkTime: item[5],
            pay: item[6],
        };
    });

    return newDataObject;
};

export default calculatePay;

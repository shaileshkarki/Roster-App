// GJ: This modules take the data object from the WEEKLY WAGES BY STAFF MEMBER ROSTER, and calculates the correct pay
import calculateBreak from "./calculateBreak.js";
const calculatePay = (data) => {
    // copy the object
    // var clonedObject = Object.assign({}, data);
    // console.log(clonedObject);

    // console.log(data);

    // just get a list of the usernames to aggregate hours and pay
    var rosterIDandTitleArray = [];
    var objectLength = Object.keys(data).length;
    var temp_pairs = [];

    // loop through the entire data object and return a set of unique Roster IDs and Job Titles in an array
    for (var i = 0; i < objectLength; i++) {
        // take a copy of the current values
        if (data[i].roster_id != temp_a && data[i].roster_id != temp_b) {
            temp_pairs.push(data[i].roster_id);
            temp_pairs.push(data[i].title);

            rosterIDandTitleArray.push(temp_pairs);
        }
        // take a copy of the current iterations values for comparison
        var temp_a = data[i].roster_id;
        var temp_b = data[i].title;

        // reset the temporary array
        temp_pairs = [];
    }

    // declare some array variables to store the data
    var temp_rosteredHours = [];
    var temp_breakTimeHours = [];
    var temp_actualWorkTimeHours = [];
    var jt = [];
    var final_records = [];
    // for each unique name, loop through the data and take the roster id, usrname, title and calculate the running total of variious variables
    for (var j = 0; j < rosterIDandTitleArray.length; j++) {
        jt = [];
        for (var i = 0; i < objectLength; i++) {
            var counter = 0;
            if (
                data[i].title === rosterIDandTitleArray[j][1] &&
                data[i].roster_id === rosterIDandTitleArray[j][0]
            ) {
                if (counter === 0) {
                    jt.push(data[i].roster_id);
                    jt.push(data[i].username);
                    jt.push(data[i].title);
                    jt.push(Number(data[i].pay_rate));

                    jt = [...new Set(jt)];
                }
                // store each persons various metrics in an array and perform necessary calculations at the individual level
                temp_rosteredHours.push(Number(data[i].rostered_hours));

                temp_breakTimeHours.push(
                    calculateBreak(data[i].rostered_hours)
                );
                temp_actualWorkTimeHours.push(
                    data[i].rostered_hours -
                        calculateBreak(data[i].rostered_hours)
                );

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
        //console.log(`temp_rosteredHours`, totalRosteredHours);

        var totalBreakTimeHours = temp_breakTimeHours.reduce(
            (total, currentValue) => {
                return total + currentValue;
            },
            0
        );
        // console.log(`temp_breakTimeHours`, totalBreakTimeHours);

        var totalActualWorkTimeHours = temp_actualWorkTimeHours.reduce(
            (total, currentValue) => {
                return total + currentValue;
            },
            0
        );
        // console.log(`temp_actualWorkTimeHours`, totalActualWorkTimeHours);

        // calculate actual pay_rate
        var totalPay = jt[3] * totalActualWorkTimeHours;

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
        jt = [...new Set(jt)];
        //console.log(jt);
        // establish the final array item for the person
        final_records.push(jt);
    }

    //console.log(final_records);
    // now create an object that replicate the data one but assigning each array item record to a key

    var newDataObject = final_records.map(function (item) {
        return {
            roster_id: item[0],
            username: item[1],
            title: item[2],
            pay_rate: item[3],
            rostered_hours: item[4],
            breakTime: item[5],
            acutalWorkTime: item[6],
            pay: item[7],
        };
    });

    return newDataObject;
};

export default calculatePay;

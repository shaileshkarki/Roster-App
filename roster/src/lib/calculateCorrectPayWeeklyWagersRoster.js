// GJ: This modules take the data object from the WEEKLY WAGE SBY ROSTER, and calculates the correct pay
const calculatePay = (data) => {
    // copy the object
    // var clonedObject = Object.assign({}, data);
    // console.log(clonedObject);

    // just get a list of the usernames to aggregate hours and pay
    var temp_uniqueNames = [];
    var objectLength = Object.keys(data).length;
    for (var i = 0; i < objectLength; i++) {
        temp_uniqueNames.push(data[i].username);
    }
    // create a unique set that only contains 1 instance of a name
    var uniqueNames = [...new Set(temp_uniqueNames)];

    // declare some array variables to store the data
    var temp_rosteredHours = [];
    var temp_breakTimeHours = [];
    var temp_actualWorkTimeHours = [];
    var jt = [];
    var final_records = [];
    // for each unique name, loop through the data and take the roster id, usrname, title and calculate the running total of variious variables
    for (var j = 0; j < uniqueNames.length; j++) {
        jt = [];
        for (var i = 0; i < objectLength; i++) {
            var counter = 0;
            if (data[i].username === uniqueNames[j]) {
                if (counter === 0) {
                    jt.push(data[i].roster_id);
                    jt.push(data[i].username);
                    jt.push(data[i].title);
                    jt.push(Number(data[i].pay_rate));
                    jt = [...new Set(jt)];
                }
                // store each persons various metrics in an array
                temp_rosteredHours.push(Number(data[i].rostered_hours));
                temp_breakTimeHours.push(data[i].breakTime);
                temp_actualWorkTimeHours.push(data[i].actualWorkTime);

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
        var totalPay = (jt[3] * totalActualWorkTimeHours * 100) / 100;

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
            username: item[1],
            title: item[2],
            pay_rate: "$" + item[3].toFixed(2),
            rostered_hours: item[4],
            breakTime: item[5],
            acutalWorkTime: item[6],
            pay: item[7],
        };
    });

    return newDataObject;
};

export default calculatePay;

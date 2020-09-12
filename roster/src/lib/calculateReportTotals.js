// This module calcualtes the TOTALS fro the bottom of the reports
const calculateReportTotals = (object) => {
    var wagesTotal = 0;
    var rosteredHoursTotal = 0;
    var breakTimeTotal = 0;
    var actualWorkTimeTotal = 0;

    var totalsObject = {};
    object.map((item) => {
        //console.log(item.pay);
        wagesTotal += item.pay;
        rosteredHoursTotal += item.rostered_hours;
        breakTimeTotal += item.breakTime;
        actualWorkTimeTotal += item.acutalWorkTime;
    });

    // create an totals object and assign values
    totalsObject.totalRosteredHours = rosteredHoursTotal;
    totalsObject.totalBreakTimeHours = breakTimeTotal;
    totalsObject.totalActualWorkTimeHours = actualWorkTimeTotal;
    totalsObject.totalWages = wagesTotal;

    return totalsObject;
};

export default calculateReportTotals;

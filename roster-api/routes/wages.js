var express = require("express");
var router = express.Router();

const {
    getTotalRosterOneWages,
    getSpecificDayWages,
    getUniqueRoles,
    getEachRosterWeekWagesByEachPersonAndRole,
    getDesiredWeekWages,
    getDesiredWeekJobWages,
    getAllUsernames,
    getWagesByDesiredUsername,
} = require("../db/wagesQueries");

// This route gets wages broken down for Roster id 1
router.get("/", async function (req, res, next) {
    // obtain all public holidays from DB
    const allTotalRosterOneWages = await getTotalRosterOneWages();

    // return results back
    res.send(allTotalRosterOneWages);
});

router.get("/daily", async function (req, res, next) {
    // obtain all public holidays from DB
    const allSpecificDayWages = await getSpecificDayWages();

    // return results back
    res.send(allSpecificDayWages);
});

// this route is used for a query to obtain all the records in the groups table. It's priamry goal is to then idetnify the unique roles to feed into other queries.
router.get("/uniqueroles", async function (req, res, next) {
    // obtain all public holidays from DB
    const allUniqueRoles = await getUniqueRoles();

    // return results back
    res.send(allUniqueRoles);
});

// this route is used for a query to obtain all the records in the groups table. It's priamry goal is to then idetnify the unique roles to feed into other queries.
router.get("/allusernames", async function (req, res, next) {
    // obtain all public holidays from DB
    const allUsernames = await getAllUsernames();
    // return results back
    // console.log("ASDFASFASDFASDFSADFADSFASDFASDFASDFA");
    // console.log(allUsernames);
    res.send(allUsernames);
});

// GJ: THE BLEOW SHOWS THE WEEKLY WAGES PAID BY ROSTER ID, PER PERSON PER ROLE
router.get("/eachrosterswagesbyperson", async function (req, res, next) {
    console.log(req.params);
    // obtain all the this information
    allEachRosterWagesByPerson = await getEachRosterWeekWagesByEachPersonAndRole();
    // return the results back
    res.send(allEachRosterWagesByPerson);
});

// GJ: the below obtains the weekly wages for the desired username for the PDF report
router.get("/wagesbydesiredusername/:username", async function (
    req,
    res,
    next
) {
    console.log(req.params, req.params.username);
    // obtain all the this information
    allEachRosterWagesByUsername = await getWagesByDesiredUsername(
        req.params.username
    );
    // return the results back
    // console.log("ASDFADSFDSADFAFDAFDA");
    // console.log(allEachRosterWagesByUsername);
    res.send(allEachRosterWagesByUsername);
});

// GJ: this route caters for the PDF report for Weekly Wages by Job Title
router.get("/jobtitle/:roster_id", async function (req, res, next) {
    // obtain all the this information
    let roster_id = Number(req.params);
    //console.log(req.params, req.params.roster_id);
    // roster_id = Number(roster_id);
    // console.log(roster_id);
    allDesiredWeekJobWages = await getDesiredWeekJobWages(req.params.roster_id);

    // return the results back
    //console.log(allDesiredWeekJobWages);
    res.send(allDesiredWeekJobWages);
});

//GJ: This route allows a parameter to be passsed for roster ID to obtain wages for that chosen week. This will be used in the PDF reprts
router.get("/:roster_id", async function (req, res, next) {
    // obtain all the this information
    let roster_id = Number(req.params);
    //console.log(req.params, req.params.roster_id);
    // roster_id = Number(roster_id);
    // console.log(roster_id);
    allDesiredWeekWages = await getDesiredWeekWages(req.params.roster_id);
    // return the results back

    //console.log(allDesiredWeekWages);
    res.send(allDesiredWeekWages);
});

module.exports = router;

var express = require("express");
var router = express.Router();
const {
  getRoster,
  getAllRosterWeeks,
  createRoster,
  addShifts,
  getCurrentWeekNumber,
  getShiftsForWeekNumber,
  getRosterWeeks,
  updateShifts,
  getRosterIdFromWeekNumber,
  getRosterPeriod,
} = require("../db/rosterQueries");

/* GET all rosters */
router.get("/allRosters", async function (req, res, next) {
  const allRosters = await getAllRosterWeeks();
  res.send(allRosters);
});

router.post("/", async function (req, res) {
  try {
    const { shifts, weekNumber, title, startDate, endDate } = req.body;

    const rosterId = await createRoster(weekNumber, title, startDate, endDate);
    await addShifts(rosterId, req.body.shifts);
  } catch (error) {
    console.log(error);
  }

  res.send("success");
});

router.put("/", async function (req, res) {
  try {
    await updateShifts(req.body.weekNumber, req.body.shifts);
  } catch (error) {
    console.log(error);
  }

  res.send("success");
});

router.get("/dates/:weekNumber", async (req, res) => {
  const rosterId = await getRosterIdFromWeekNumber(req.params.weekNumber);
  const rosterPeriod = await getRosterPeriod(rosterId);
  res.send(rosterPeriod);
});

router.get("/weeknumber", async function (req, res) {
  try {
    const weekNumber = await getCurrentWeekNumber();
    console.log(weekNumber);
    res.send({ weekNumber: weekNumber });
  } catch (error) {
    console.log(error);
  }
});

router.get("/weeks", async (req, res) => {
  try {
    const { rows } = await getRosterWeeks();
    console.log(rows);
    res.send(rows);
  } catch (error) {
    console.log(error);
  }
});

router.get("/shifts/:week", async (req, res) => {
  const weekNumber = req.params.week;
  try {
    const shifts = await getShiftsForWeekNumber(weekNumber);
    // console.log("shifts = ", shifts);
    res.send(shifts);
  } catch (error) {
    console.log(error);
  }
});

/* GET all shifts of a roster */
router.get("/:rosterID", async function (req, res, next) {
  // console.log("roster router");
  let roster_ID = Number(req.params.rosterID);
  console.log("Geta all shifts", req);
  const roster = await getRoster(roster_ID);
  // console.log(roster);
  res.send(roster);
});
module.exports = router;

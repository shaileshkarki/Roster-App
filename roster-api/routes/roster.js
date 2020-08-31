var express = require("express");
var router = express.Router();
const { getRoster, getAllRosterWeeks } = require("../db/rosterQueries");

/* GET all rosters */
router.get("/allRosters", async function (req, res, next) {
  const allRosters = await getAllRosterWeeks();
  res.send(allRosters);
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

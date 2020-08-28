var express = require("express");
var router = express.Router();
const { getRoster } = require("../db/rosterQueries");

/* GET all roster */
router.get("/", async function (req, res, next) {
  // console.log("roster router");
  const roster = await getRoster("2020-08-24", "2020-08-30");
  // console.log(roster);
  res.send(roster);
});

module.exports = router;

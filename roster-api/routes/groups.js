var express = require("express");
var router = express.Router();
const { getAllGroups, createRoster, addShifts } = require("../db/groupQueris");

/* GET all groups */
router.get("/", async function (req, res, next) {
  const allGroups = await getAllGroups();

  res.send(allGroups);
});

router.post("/roster/create", async function (req, res) {
  try {
    const { roster_id } = await createRoster(req.body.weekNumber);
    await addShifts(roster_id, req.body.shifts);
  } catch (error) {
    console.log(error);
  }

  res.send("success");
});

module.exports = router;

var express = require("express");
var router = express.Router();

const { getAllStaff } = require("../db/staffQueries");

/* GET all staff */
router.get("/", async function (req, res, next) {
  const allStaff = await getAllStaff();
  res.send(allStaff);
});

module.exports = router;

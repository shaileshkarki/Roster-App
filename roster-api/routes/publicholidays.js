var express = require("express");
var router = express.Router();

// import the function to get all the public holidays
const { getAllPublicHolidays } = require("../db/publicHolidays");

/* GET all public holidays */

router.get("/", async function (req, res, next) {
    const allPublicHolidays = await getAllPublicHolidays();
    res.send(allPublicHolidays);
});

module.exports = router;
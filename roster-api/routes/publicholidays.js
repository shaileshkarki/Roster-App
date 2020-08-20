const axios = require("axios");
var express = require("express");
var router = express.Router();

// import the function to get all the public holidays
const {
    getAllPublicHolidays,
    synchronisePublicHolidays,
} = require("../db/publicHolidays");

/* GET all public holidays */

router.put("/", async function (req, res, next) {
    // const allPublicHolidays = await getAllPublicHolidays();
    // console.log("SHAILESH IS HERE!!!!!");
    await synchronisePublicHolidays();

    res.send("SHAILESH IS HERE");
});

router.get("/", async function (req, res, next) {
    // obtain all public holidays from DB
    const allPublicHolidays = await getAllPublicHolidays();

    // return results back
    res.send(allPublicHolidays);
});

module.exports = router;

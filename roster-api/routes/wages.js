var express = require("express");
var router = express.Router();

const { getTotalRosterOneWages } = require("../db/wagesQueries");

// insert code here
router.get("/", async function (req, res, next) {
    // obtain all public holidays from DB
    const allTotalRosterOneWages = await getTotalRosterOneWages();

    // return results back
    res.send(allTotalRosterOneWages);
});

module.exports = router;

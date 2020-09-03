var express = require("express");
var router = express.Router();

const { getAllWageInfo } = require("../db/wagesQueries");

// insert code here
router.get("/", async function (req, res, next) {
    // obtain all public holidays from DB
    const allWageInfo = await getAllWageInfo();

    // return results back
    res.send(allWageInfo);
});

module.exports = router;

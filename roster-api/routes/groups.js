var express = require("express");
var router = express.Router();
const { getAllGroups } = require("../db/groupQueries");
const { route } = require("./staff");
const { response } = require("express");

/* GET all groups */
router.get("/", async function (req, res, next) {
  const allGroups = await getAllGroups();

  res.send(allGroups);
});

module.exports = router;

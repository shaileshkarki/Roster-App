var express = require("express");
var router = express.Router();
const {
  getAllGroups,
  createGroup,
  editGroup,
  deleteGroup,
} = require("../db/groupQueries");

/* GET all groups */
router.get("/", async function (req, res, next) {
  const allGroups = await getAllGroups();

  res.send(allGroups);
});

router.post("/create", async function (req, res, next) {
  const result = await createGroup(
    req.body.newGroup.groupTitle,
    req.body.newGroup.groupDuration,
    req.body.newGroup.payRate
  );

  res.send(result);
});

//update group
router.put("/edit/:id", async function (req, res, next) {
  console.log("reached to put route");
  console.log(
    req.params.id,
    req.body.updatedGroup.title,
    req.body.updatedGroup.groupDuration,
    req.body.updatedGroup.payRate
  );
  const result = await editGroup(
    req.params.id,
    req.body.updatedGroup.title,
    req.body.updatedGroup.groupDuration,
    req.body.updatedGroup.payRate
  );

  res.send(result);
});

//delete group
router.delete("/delete/:id", async function (req, res, next) {
  console.log("reached to delete route");
  console.log(req.params.id);
  const result = await deleteGroup(req.params.id);
  res.send(result);
});
module.exports = router;

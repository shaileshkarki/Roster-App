var express = require("express");
var router = express.Router();

const {
  getAllStaff,
  createStaffMember,
  updateStaffMember,
} = require("../db/staffQueries");

/* GET all staff */
router.get("/", async function (req, res, next) {
  const allStaff = await getAllStaff();
  res.send(allStaff);
});

/* Create staff member */
router.post("/", async function (req, res, next) {
  console.log(req.body.newStaffMember);
  const savedStaffMemebr = await createStaffMember(req.body.newStaffMember);
  console.log("Saved staff member", savedStaffMemebr);
  res.send(savedStaffMemebr);
});

/* Update staff member */
router.put("/:staffId", async function (req, res, next) {
  console.log("update", req.body.updatedStaffMember);
  const updatedStaffMemebr = await updateStaffMember(
    req.body.updatedStaffMember
  );
  console.log("Updated staff member", updatedStaffMemebr);
  res.send(updatedStaffMemebr);
});
module.exports = router;

var express = require("express");
var router = express.Router();

const {
  getAllActiveStaff,
  createStaffMember,
  updateStaffMember,
  removeStaffMember,
  getStaffRoles,
  getAllActiveStaffAndRoles,
  getRolesForStaffMember,
  checkIsEmailUnique,
  checkIsEmailSameAsBeforeUpdate,
} = require("../db/staffQueries");
const { runSql } = require("../db/queries");

/* GET all staff */
router.get("/", async function (req, res, next) {
  const allStaff = await getAllActiveStaff();
  res.send(allStaff);
});
router.get("/withroles", async function (req, res, next) {
  try {
    const staffWithRoles = await getAllActiveStaffAndRoles();
    res.send(staffWithRoles);
  } catch (error) {
    console.log(error);
  }
});
router.get("/roles", async (req, res) => {
  const allStaff = await getAllActiveStaff();

  const staffWithRoles = await getStaffRoles(allStaff);
  res.send(staffWithRoles);
});

router.get("/assignedroles/:staffId", async (req, res) => {
  const roles = await getRolesForStaffMember(req.params.staffId);
  res.send(roles);
  return roles;
});

router.get("/email/:email/:staffId", async (req, res) => {
  console.log("email", req.params.email);
  console.log("staff Id", req.params.staffId);
  const isEmailSameAsBeforeUpdate = await checkIsEmailSameAsBeforeUpdate(
    req.params.email,
    req.params.staffId
  );
  if (isEmailSameAsBeforeUpdate) {
    res.send(isEmailSameAsBeforeUpdate);
  } else {
    const isEmailUnique = await checkIsEmailUnique(req.params.email);
    res.send(isEmailUnique);
  }
});

router.get("/email/:email", async (req, res) => {
  console.log("email", req.params.email);
  const isEmailUnique = await checkIsEmailUnique(req.params.email);
  res.send(isEmailUnique);
});
/* Create staff member */
router.post("/", async function (req, res, next) {
  console.log(req.body.newStaffMember);

  try {
    const savedStaffMemeber = await createStaffMember(req.body.newStaffMember);
    console.log("Saved staff member", savedStaffMemeber);
    res.send(savedStaffMemeber);
  } catch (error) {
    console.log("error in route get /staff/", error);
    res.status(500);
    res.send(error.message);
  }
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

/* remove staff member */
router.put("/remove/:staffId", async function (req, res, next) {
  console.log("remove", req.body.removedStaffMember);
  const removedStaffMemebr = await removeStaffMember(
    req.body.removedStaffMember
  );
  console.log("remoeved staff member", removedStaffMemebr);
  res.send(removedStaffMemebr);
});

module.exports = router;

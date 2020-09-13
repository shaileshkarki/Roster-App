var express = require("express");
var router = express.Router();
const bcrypt = require("bcrypt");
const { doLogin, createUser } = require("../db/login");
/* GET users listing. */
router.get("/", function (req, res, next) {
  res.send("respond with a resource");
});

router.post("/login", async function (req, res, next) {
  let { email, password } = req.body.user;
  console.log({ email }, { password });
  let result = await doLogin(email, password);
  console.log("result", result);
  res.send(result);
});

router.post("/register", async function (req, res, next) {
  let { email, password } = req.body.user;
  console.log({ password });
  let hashedPassword = await bcrypt.hash(password, 10);
  console.log({ hashedPassword });
  try {
    const savedUser = await createUser(email, hashedPassword);
    console.log("Saved staff member", savedUser);
    console.log("savedUser", savedUser);
    res.send(savedUser);
  } catch (error) {
    console.log("Email already exists", error);
    // res.status(500);
    res.send(error.message);
  }
});

module.exports = router;

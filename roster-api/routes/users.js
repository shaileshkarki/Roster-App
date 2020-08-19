var express = require('express');
var router = express.Router();
const {
  doLogin,
  createUser
} = require("../db/login");
/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send('respond with a resource');
});


router.post('/login', async function (req, res, next) {
  let { email, password } = req.body.user;
  let result = await doLogin(email, password);
  if (result.length === 0) {
    res.status(500).send("login failed");
  }
  res.send("login success");
})

router.post('/register', async function (req, res, next) {
  let { email, password } = req.body.user;
  const savedUser = await createUser(email, password);
  console.log("Saved staff member", savedUser);
  res.send(savedUser);
})

module.exports = router;

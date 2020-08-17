var express = require("express");
var router = express.Router();

router.post("/", (req, res) => {
    console.log("HELLO");
    // let email = req.body.email;
    // let password_digest = bcrypt.hashSync(req.body.password_digest, 10);
    // console.log("email", email, "password_digest", password_digest);
    // let rowCount = 0;
    // db.query(`select * from users where email = '${email}';`, (err, dbRes) => {
    //     // console.log(dbRes.rows.length);
    //     rowCount = dbRes.rows.length;
    //     if (rowCount == 0) {
    //         db.query(
    //             `INSERT INTO users (email,password_digest) VALUES ('${email}','${password_digest}');`,
    //             (err, dbRes) => {
    //                 console.log("Data inserted:");
    //             }
    //         );
    //     }
    // });
    res.json({ result: "user created" });
});

module.exports = router;

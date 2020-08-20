const { runSql } = require("./queries");
const bcrypt = require('bcrypt');

const doLogin = async (email, password) => {
    const sql = "Select * FROM users Where email = $1;";
    const params = [email];
    const { rows } = await runSql(sql, params);
    if (bcrypt.compareSync(password, rows[0].password)) {
        return rows;
    } else {
        console.log("Password and email did not match")
    }
}

const createUser = async (email, hashedPassword) => {
    const sql = `INSERT INTO users (email, password) VALUES ($1,$2);`;
    const params = [
        email,
        hashedPassword
    ];
    await runSql(sql, params);

    return (newUser = {
        email: email
    });
};

module.exports = {
    doLogin,
    createUser
};
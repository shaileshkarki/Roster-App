const { runSql } = require("./queries");

const doLogin = async (email, password) => {
    const sql = "Select * FROM users Where email = $1 and password = $2;";
    const params = [email, password];
    const { rows } = await runSql(sql, params);
    return rows;
}

const createUser = async (email, password) => {
    const sql = `INSERT INTO users (email, password) VALUES ($1,$2);`;
    const params = [
        email,
        password
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
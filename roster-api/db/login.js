const { runSql } = require("./queries");
const bcrypt = require("bcrypt");

const doLogin = async (email, password) => {
  const sql1 = "Select * FROM users WHERE email=$1;";
  const rows1 = await runSql(sql1, [email]);
  const sql2 = "Select * FROM staff WHERE email=$1;";
  const rows2 = await runSql(sql2, [email]);

  console.log("rows1", rows1.rows);
  console.log("rows2", rows2.rows);
  if (rows1.rows.length == 1 && rows2.rows.length == 1) {
    const sql =
      "select users.email,users.password, users.user_id, groups.title from users,staff,stafftogroups,groups where users.email=staff.email and staff.staff_id=stafftogroups.staff_member_id and stafftogroups.staff_role_id=groups.id and users.email=$1;";
    const params = [email];
    const { rows } = await runSql(sql, params);
    if (bcrypt.compareSync(password, rows[0].password)) {
      // console.log("doLogin rows", rows);
      let arr = [];
      rows.forEach((role) => arr.push(role.title));
      let tempResult = {};
      tempResult.email = rows[0].email;
      tempResult.password = rows[0].password;
      tempResult.role = arr;
      let result = [];
      result.push(tempResult);
      console.log("reached here login2");
      return result;
    } else {
      console.log("Password and email did not match");
      return "Password and email did not match";
    }
  } else if (rows1.rows.length == 1 && rows2.rows.length === 0) {
    return "User is not authorised as staff";
  } else {
    return "Not registered user";
  }
};

const createUser = async (email, hashedPassword) => {
  try {
    let result = false;
    const sql = "Select * FROM users WHERE email=$1;";
    const { rows } = await runSql(sql, [email]);
    if (rows.length === 0) {
      try {
        const newSQL = "INSERT INTO users (email, password) VALUES ($1,$2);";
        const response = await runSql(newSQL, [email, hashedPassword]);
        console.log({ response });
        result = true;
      } catch (error) {
        console.log(error);
      }
    }
    return result;
  } catch (error) {
    console.log(error);
  }
};
module.exports = {
  doLogin,
  createUser,
};

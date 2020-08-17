const { runSql } = require("./queries");

const getAllStaff = async () => {
  const sql = "Select * FROM staff ORDER BY lastname;";
  const { rows } = await runSql(sql, []);
  let allStaff = [];
  rows.forEach((row) => allStaff.push(row));

  return allStaff;
};

const createStaffMember = async ({
  firstname,
  lastname,
  address,
  city,
  state,
  postCode,
  email,
}) => {
  const sql = `INSERT INTO staff (username, firstname, lastname, address, city, state, postcode,  picture_url, notes, email, user_id, group_id) VALUES ('username',$1,$2,$3,$4,$5,$6,'https://i.pravatar.cc/300','notes',$7,1,1)`;
  const params = [firstname, lastname, address, city, state, postCode, email];
  await runSql(sql, params);

  return (staffMember = {
    firstname,
    lastname,
    address,
    city,
    state,
    postCode,
    email,
  });
};
const updateStaffMember = async ({
  staffId,
  firstname,
  lastname,
  address,
  city,
  state,
  postCode,
  email,
}) => {
  const sql = `UPDATE staff SET firstname = $1, lastname = $2, address = $3, city = $4, state = $5, postcode = $6,  email = $7 WHERE staff_id = $8`;
  const params = [
    firstname,
    lastname,
    address,
    city,
    state,
    postCode,
    email,
    staffId,
  ];
  console.log(sql, params);
  await runSql(sql, params);

  return (staffMember = {
    staffId,
    firstname,
    lastname,
    address,
    city,
    state,
    postCode,
    email,
  });
};

module.exports = {
  getAllStaff,
  createStaffMember,
  updateStaffMember,
};

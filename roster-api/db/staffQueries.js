const { runSql } = require("./queries");

const getAllActiveStaff = async () => {
  const sql = "Select * FROM staff Where is_active = true ORDER BY lastname;";
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
  isActive,
}) => {
  const sql = `INSERT INTO staff (username, firstname, lastname, address, city, state, postcode,  picture_url, notes, email, is_active,user_id, group_id) VALUES ('username',$1,$2,$3,$4,$5,$6,'https://i.pravatar.cc/300','notes',$7,$8,1,1)`;
  const params = [
    firstname,
    lastname,
    address,
    city,
    state,
    postCode,
    email,
    isActive,
  ];
  await runSql(sql, params);

  return (staffMember = {
    firstname,
    lastname,
    address,
    city,
    state,
    postCode,
    email,
    isActive,
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

const removeStaffMember = async ({ staffId }) => {
  const sql = `UPDATE staff SET  is_active = $1 WHERE staff_id = $2`;
  const params = [false, staffId];
  console.log(sql, params);
  await runSql(sql, params);

  return (staffMember = {
    staffId,
  });
};
module.exports = {
  getAllActiveStaff,
  createStaffMember,
  updateStaffMember,
  removeStaffMember,
};

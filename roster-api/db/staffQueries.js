const { runSql } = require("./queries");

const getAllActiveStaff = async () => {
  const sql = "Select * FROM staff Where is_active = true ORDER BY lastname;";
  const { rows } = await runSql(sql, []);
  let allStaff = [];
  rows.forEach((row) => allStaff.push(row));

  return allStaff;
};

const getStaffRoles = async (staff) => {
  let staffWithRoles = [];

  for (let i = 0; i < staff.length; i++) {
    try {
      const sql = "Select * FROM stafftogroups Where staff_member_id = $1;";
      const params = [staff[i].staff_id];
      console.log("staff id = ", staff[i].staff_id);

      try {
        const { rows } = await runSql(sql, params);
        rows.forEach((row) => {
          staffWithRoles.push({ ...row, name: staff[i].firstname });
        });
      } catch (error) {
        console.log(error);
      }
    } catch (error) {
      console.log(error);
    }
  }

  return staffWithRoles;
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
  phone,
}) => {
  const sql = `INSERT INTO staff (username, firstname, lastname, address, city, state, postcode,  picture_url, notes, email, is_active,user_id, phone_number, group_id) VALUES ('username',$1,$2,$3,$4,$5,$6,'https://i.pravatar.cc/300','notes',$7,$8,1,$9,1)`;
  const params = [
    firstname,
    lastname,
    address,
    city,
    state,
    postCode,
    email,
    isActive,
    phone,
  ];

  try {
    await runSql(sql, params);
  } catch (error) {
    console.log(error);
  }

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
  phone,
}) => {
  const sql = `UPDATE staff SET firstname = $1, lastname = $2, address = $3, city = $4, state = $5, postcode = $6,  email = $7, phone_number = $8 WHERE staff_id = $9`;
  const params = [
    firstname,
    lastname,
    address,
    city,
    state,
    postCode,
    email,
    phone,
    staffId,
  ];
  console.log(sql, params);

  try {
    await runSql(sql, params);
  } catch (error) {
    console.log(error);
  }

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

  try {
    await runSql(sql, params);
  } catch (error) {
    console.log(error);
  }

  return (staffMember = {
    staffId,
  });
};
module.exports = {
  getAllActiveStaff,
  createStaffMember,
  updateStaffMember,
  removeStaffMember,
  getStaffRoles,
};

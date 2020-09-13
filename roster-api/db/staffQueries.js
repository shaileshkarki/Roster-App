const { runSql } = require("./queries");
const { getAllGroups } = require("./groupQueries");

const getAllActiveStaff = async () => {
  const sql = "Select * FROM staff Where is_active = true ORDER BY lastname;";
  const { rows } = await runSql(sql, []);
  let allStaff = [];
  rows.forEach((row) => allStaff.push(row));

  return allStaff;
};
const getAllActiveStaffAndRoles = async () => {
  const staff = await getAllActiveStaff();
  const groups = await getAllGroups();
  let staffWithRoles = [];
  for (let i = 0; i < staff.length; i++) {
    staff[i].roles = "";
    try {
      const sql = "SELECT * FROM stafftogroups WHERE staff_member_id = $1;";
      const params = [staff[i].staff_id];
      const staffRoles = await runSql(sql, params);

      staffRoles.rows.map((role) => {
        groups.map((group) => {
          if (group.id === role.staff_role_id) {
            console.log(
              "staff id = " + staff[i].staff_id + " role = " + group.title
            );
            staff[i].roles += `\n${group.title}, `;
          }
        });
      });
      console.log("Staff roles = " + staff[i].roles);
      staffWithRoles.push(staff[i]);
    } catch (error) {
      console.log(error);
    }
  }
  return staffWithRoles;
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

const getRolesForStaffMember = async (staffId) => {
  try {
    const sql = "Select * FROM stafftogroups Where staff_member_id = $1;";
    const params = [staffId];
    const { rows } = await runSql(sql, params);
    return rows;
  } catch (error) {
    console.log(error);
  }
};

const getStaffIdByEmail = async (email) => {
  const sql = "SELECT staff_id from staff where email = $1;";
  const params = [email];
  try {
    const { rows } = await runSql(sql, params);
    // console.log("#####" + Object.keys(rows[0]));
    return rows[0];
  } catch (error) {
    console.log(error);
  }
};
const assignRoles = async (roles, staffId) => {
  for (let i = 0; i < roles.length; i++) {
    const sql =
      "INSERT INTO stafftogroups (staff_member_id, staff_role_id) VALUES ($1,$2);";
    const params = [staffId, roles[i].id];
    try {
      await runSql(sql, params);
    } catch (error) {
      console.log(error);
    }
  }
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
  roles,
}) => {
  const sql = `INSERT INTO staff (username, firstname, lastname, address, city, state, postcode,  picture_url, notes, email, is_active, phone_number) VALUES ('username',$1,$2,$3,$4,$5,$6,'https://i.pravatar.cc/300','notes',$7,$8,$9)`;
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

  // GJ: 09/09: copied the original query and changed it to remove "group-id" and "user_id". Given that user_id is in the STAFF table and have temporarliyt removed it, inserts are not working. Perhaps removing group_id may make it work.
  // GJ: Note: username is missing form the ADD STAFF Screen
  // const sql = `INSERT INTO staff (username, firstname, lastname, address, city, state, postcode,  picture_url, notes, email, is_active,user_id, phone_number, group_id) VALUES ('username',$1,$2,$3,$4,$5,$6,'https://i.pravatar.cc/300','notes',$7,$8,1,$9,1)`;

  try {
    await runSql(sql, params);
    const { staff_id } = await getStaffIdByEmail(email);
    await assignRoles(roles, staff_id);
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
  roles,
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
    const { rows } = await getRolesForStaffMember(staffId);
    await updateRoles(roles, staffId);
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
    roles,
  });
};

const updateRoles = async (roles, staffId) => {
  const sql = "DELETE from stafftogroups Where staff_member_id = $1;";
  const params = [staffId];
  try {
    await runSql(sql, params);
  } catch (error) {
    console.log(error);
  }

  try {
    await assignRoles(roles, staffId);
  } catch (error) {
    console.log(error);
  }
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

const checkIsEmailUnique = async (email) => {
  const sql = "SELECT * from staff where email = $1;";
  const params = [email];
  console.log(email);
  try {
    const { rows } = await runSql(sql, params);
    return rows.length > 0 ? false : true;
  } catch (error) {
    console.log(error);
  }
};

const checkIsEmailSameAsBeforeUpdate = async (email, staffId) => {
  try {
    const sql = "SELECT email FROM staff WHERE staff_id = $1;";
    const params = [staffId];
    const { rows } = await runSql(sql, params);

    console.log(rows);
    return rows[0].email === email;
  } catch (error) {
    console.log(error);
  }
};
module.exports = {
  getAllActiveStaff,
  createStaffMember,
  updateStaffMember,
  removeStaffMember,
  getStaffRoles,
  getAllActiveStaffAndRoles,
  getRolesForStaffMember,
  checkIsEmailUnique,
  checkIsEmailSameAsBeforeUpdate,
};

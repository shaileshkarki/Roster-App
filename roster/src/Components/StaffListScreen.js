import React, { useEffect, useState } from "react";
import useStaffApi from "../hooks/useStaffApi";
import { MDBRow, MDBCol } from "mdbreact";
import PaginationTable from "rbtpagination";
import { Button } from "react-bootstrap";

import "../../node_modules/rbtpagination/dist/index.css";
import LeftSidebar from "./LeftSidebar";

const searchByCriteraiList = [
  { label: "ID", key: "staff_id" },
  { label: "First Name", key: "firstname" },
  { label: "Last Name", key: "lastname" },
  { label: "Address", key: "address" },
  { label: "City", key: "city" },
  { label: "State", key: "state" },
  { label: "Post Code", key: "postcode" },
  { label: "Email", key: "email" },
  { label: "Phone", key: "phone_number" },
];

const tableColumnsAndDataKeys = [
  { label: "ID", key: "staff_id" },
  { label: "First Name", key: "firstname" },
  { label: "Last Name", key: "lastname" },
  { label: "Address", key: "address" },
  { label: "City", key: "city" },
  { label: "State", key: "state" },
  { label: "Post Code", key: "postcode" },
  { label: "Email", key: "email" },
  { label: "Phone", key: "phone_number" },
  { label: "Photo", key: "photo" },
  { label: "Roles", key: "roles" },
];
function StaffListScreen(props) {
  const { data, request: getAllActiveStaffList } = useStaffApi();
  // All staff from database

  useEffect(() => {
    getAllActiveStaffList();
  }, []);

  return (
    <div>
      <MDBRow center>
        <MDBCol sm="12" md="12" lg="12" xl="12">
          <LeftSidebar />
        </MDBCol>
      </MDBRow>
      <h2>Staff Administration</h2>
      <PaginationTable
        dataSet={data}
        searchData={searchByCriteraiList}
        tableData={tableColumnsAndDataKeys}
        handleItemClick={true}
        itemClickRedirect="/StaffEditScreen"
        itemsPerPage={20}
      />

      <MDBRow className="button-panel">
        <MDBCol>
          <Button href="/StaffNewScreen" block>
            Create New Staff
          </Button>
        </MDBCol>
        <MDBCol>
          <Button href="/admin" block>
            Back
          </Button>
        </MDBCol>
      </MDBRow>
    </div>
  );
}

export default StaffListScreen;

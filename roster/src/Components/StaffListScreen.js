import React, { useEffect, useState } from "react";
import useStaffApi from "../hooks/useStaffApi";
import Table from "react-bootstrap/Table";
import LeftSidebar from './LeftSidebar';
import ReportsFooter from './ReportsFooter';
let currentPage = 0;
const numberOfStaffPerPage = 2;

function StaffListScreen(props) {
  const { data: staff, isLastPage, request: getAllStaff } = useStaffApi();

  useEffect(() => {
    getAllStaff(currentPage, numberOfStaffPerPage);
  }, []);

  return (


    <div>
      <div class="container-fluid text-center">
        <LeftSidebar />
        {/* <MiddleContainer /> */}
        <div class="col-sm-10 text-left">
          <div>
            <Table bordered responsive="sm" hover>
              <thead>
                <tr>
                  <th>ID</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Address</th>
                  <th>City</th>
                  <th>State</th>
                  <th>Post Code</th>
                  <th>Email</th>
                </tr>
              </thead>
              <tbody>
                {/* {console.log("2")} */}
                {staff.map((staffMember, index) => (
                  <tr key={index}>
                    <td>{staffMember.staff_id}</td>
                    <td>{staffMember.firstname}</td>
                    <td>{staffMember.lastname}</td>
                    <td>{staffMember.address}</td>
                    <td>{staffMember.city}</td>
                    <td>{staffMember.state}</td>
                    <td>{staffMember.postcode}</td>
                    <td>{staffMember.email}</td>
                  </tr>
                ))}
              </tbody>
            </Table>
            <button
              onClick={() => {
                if (!isLastPage) {
                  currentPage += 1;
                  getAllStaff(currentPage, numberOfStaffPerPage);
                }
              }}
            >
              Next
      </button>
          </div>
        </div>
      </div>
      <ReportsFooter />
    </div>
  );
}

export default StaffListScreen;

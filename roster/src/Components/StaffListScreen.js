import React, { useEffect, useState } from "react";
import useStaffApi from "../hooks/useStaffApi";
import Table from "react-bootstrap/Table";
import LeftSidebar from "./LeftSidebar";
import ReportsFooter from "./ReportsFooter";
import { MDBContainer, MDBRow, MDBCol, MDBTable } from "mdbreact";

import Pagination from "react-bootstrap-4-pagination";
import { SplitButton, Dropdown, ButtonGroup, Button } from "react-bootstrap";

import "./StaffListScreen.css";

import useStaffApi from "../hooks/useStaffApi";
import { paginate } from "../lib/pagination";
const searchByCriteraiList = [
  { label: "ID", key: "staff_id" },
  { label: "First Name", key: "firstname" },
  { label: "Last Name", key: "lastname" },
  { label: "Address", key: "address" },
  { label: "City", key: "city" },
  { label: "State", key: "state" },
  { label: "Post Code", key: "postcode" },
  { label: "Email", key: "email" },
];
function StaffListScreen(props) {
  const { data: staff, isLastPage, request: getAllStaff } = useStaffApi();

  useEffect(() => {
    getAllStaff(currentPage, numberOfStaffPerPage);
  }, []);

  return (
    <MDBContainer fluid size="12" sm="12" md="12" lg="12" xl="12">
      <MDBRow size="12" sm="12" md="12" lg="12" xl="12">
        <MDBCol size="12" sm="4" md="4" lg="2" xl="2">
          <LeftSidebar />
        </MDBCol>
        <MDBCol size="12" sm="8" md="8" lg="10" xl="10">
          <MDBRow size="12" sm="12" md="12" lg="12" xl="12">
            <MDBCol>
              <div className={"staff-list-search"}>
                <div className={"space-evenly"}>
                  <input
                    type="text"
                    name="search"
                    placeholder="Search by ..."
                    onChange={searchForStaffMember}
                    value={searchCriteriaValue}
                  />
                  {[SplitButton].map((DropdownType, idx) => (
                    <DropdownType
                      as={ButtonGroup}
                      key={idx}
                      id={`dropdown-button-drop-${idx}`}
                      size="sm"
                      title={searchCriteria.label}
                    >
                      {searchByCriteraiList.map((criteria, index) => (
                        <Dropdown.Item
                          key={index}
                          onClick={(e) => {
                            setSearchCriteria(criteria);
                            setSearchCriteriaValue("");
                            setScreen(
                              allStaffList,
                              false,
                              numberOfStaffPerPage
                            );
                          }}
                          eventKey={index}
                        >
                          {criteria.label}
                        </Dropdown.Item>
                      ))}
                    </DropdownType>
                  ))}
                </div>
                <div className="space-evenly">
                  <label>Staff per page</label>
                  <input
                    type="number"
                    name="numberOfItemsPerPage"
                    onChange={changeNumberOfItemsPerPage}
                    value={numberOfStaffPerPage}
                  />
                </div>
              </div>
            </MDBCol>
          </MDBRow>
          <MDBRow>
            <MDBCol>
              <MDBTable style={{ wordBreak: "break-all" }} bordered hover>
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
                    <th>Photo</th>
                  </tr>
                </thead>
                <tbody>
                  {paginationData.map((staffMember, index) => (
                    <tr
                      onClick={() =>
                        history.push("/StaffEditScreen", staffMember)
                      }
                      key={index}
                    >
                      <td>{staffMember.staff_id}</td>
                      <td>{staffMember.firstname}</td>
                      <td>{staffMember.lastname}</td>
                      <td>{staffMember.address}</td>
                      <td>{staffMember.city}</td>
                      <td>{staffMember.state}</td>
                      <td>{staffMember.postcode}</td>
                      <td>{staffMember.email}</td>
                      <td>
                        {
                          <img src="https://api.adorable.io/avatars/40/abott@adorable.png"></img>
                        }
                      </td>
                    </tr>
                  ))}
                </tbody>
              </MDBTable>
            </MDBCol>
          </MDBRow>

          <Pagination className="pagination" {...paginationConfig} />
          <div className={"results"}>
            <label>
              {numberOfStaffPerPage > 0 ? `${current} of ${total}` : "0 of 0"}
            </label>
          </div>
          <div className="button-panel">
            <Button
              className="button-width"
              variant="outline-primary"
              href="/StaffNewScreen"
            >
              Create New Staff
            </Button>
            <Button
              className="button-width"
              variant="outline-primary"
              href="/admin"
            >
              Back
            </Button>
          </div>
        </MDBCol>
      </MDBRow>
    </MDBContainer>
  );
}

export default StaffListScreen;

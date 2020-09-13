import React, { useContext } from "react";
import Button from "react-bootstrap/Button";
import {
  MDBRow,
  MDBCol,
  MDBDropdown,
  MDBDropdownToggle,
  MDBDropdownMenu,
  MDBDropdownItem,
} from "mdbreact";
import { useAuth } from "../context/auth";

function LeftSidebar(props) {
  const { authTokens } = useAuth();
  return (
    <MDBRow center className="m-1">
      {authTokens != null &&
      (authTokens.role.includes("Manager") ||
        authTokens.role.includes("Supervisor")) ? (
        <>
          <MDBCol sm="6" md="3" lg="2" xl="2">
            <MDBDropdown>
              <MDBDropdownToggle caret color="secondary">
                Roster Menu
              </MDBDropdownToggle>
              <MDBDropdownMenu color="secondary" basic>
                <MDBDropdownItem href="/ViewRosterScreen">
                  View Roster
                </MDBDropdownItem>
                <MDBDropdownItem divider />
                <MDBDropdownItem href="/CreateRosterScreen">
                  Create Roster
                </MDBDropdownItem>
                <MDBDropdownItem divider />
                <MDBDropdownItem href="/ViewRosterScreen2">
                  Edit Roster
                </MDBDropdownItem>
                {/* <MDBDropdownItem href="">Delete Roster</MDBDropdownItem> */}
              </MDBDropdownMenu>
            </MDBDropdown>
          </MDBCol>
          <MDBCol sm="6" md="3" lg="2" xl="2">
            <MDBDropdown>
              <MDBDropdownToggle caret color="secondary">
                User Menu
              </MDBDropdownToggle>
              <MDBDropdownMenu basic>
                <MDBDropdownItem href="/StaffListScreen">
                  View Staffs
                </MDBDropdownItem>
                <MDBDropdownItem divider />
                <MDBDropdownItem href="/StaffNewScreen">
                  Add New Staff
                </MDBDropdownItem>
                <MDBDropdownItem divider />
                <MDBDropdownItem href="/ViewGroups">View Roles</MDBDropdownItem>
                <MDBDropdownItem divider />
                <MDBDropdownItem href="/createGroup">
                  Create New Role
                </MDBDropdownItem>
              </MDBDropdownMenu>
            </MDBDropdown>
          </MDBCol>
          <MDBCol sm="6" md="3" lg="2" xl="2">
            <MDBDropdown>
              <MDBDropdownToggle caret color="secondary">
                WAGE & OTHERS
              </MDBDropdownToggle>
              <MDBDropdownMenu basic>
                <MDBDropdownItem href="/wages">
                  View Wage Report
                </MDBDropdownItem>
                <MDBDropdownItem divider />
                <MDBDropdownItem href="/PublicHolidays">
                  View Public Holidays
                </MDBDropdownItem>
                {/* <MDBDropdownItem href="">Edit Roster</MDBDropdownItem>
                <MDBDropdownItem href="">Delete Roster</MDBDropdownItem> */}
              </MDBDropdownMenu>
            </MDBDropdown>
          </MDBCol>
        </>
      ) : (
        <>
          <MDBCol sm="6" md="3" lg="2" xl="2">
            <Button
              className="w-100 h-100 d-inline-block m-1"
              variant="primary"
              href="/ViewRosterScreen"
            >
              View Roster
            </Button>
          </MDBCol>
          <MDBCol sm="6" md="3" lg="2" xl="2">
            <Button
              className="w-100 h-100 d-inline-block m-1"
              variant="danger"
              href="/wages"
            >
              View Wage Reports
            </Button>
          </MDBCol>
          <MDBCol sm="6" md="3" lg="2" xl="2">
            <Button
              className="w-100 h-100 d-inline-block m-1"
              variant="danger"
              href="/PublicHolidays"
            >
              Public Holidays
            </Button>
          </MDBCol>
        </>
      )}
    </MDBRow>
  );
}

export default LeftSidebar;

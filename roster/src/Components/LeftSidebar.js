import React from "react";
import Button from "react-bootstrap/Button";
import { MDBRow, MDBCol } from "mdbreact";
class LeftSidebar extends React.Component {
  render() {
    return (
      <MDBRow left className="m-1">
        <MDBCol sm="6" md="3" lg="2" xl="2">
          <Button
            variant="primary"
            href="/StaffListScreen"
            className="w-100 h-100 d-inline-block m-1"
          >
            Staff Admin
          </Button>
        </MDBCol>
        <MDBCol sm="6" md="3" lg="2" xl="2">
          <Button
            className="w-100 h-100 d-inline-block m-1"
            variant="danger"
            href="/ViewGroups"
          >
            View Roles
          </Button>
        </MDBCol>
        <MDBCol sm="6" md="3" lg="2" xl="2">
          <Button
            className="w-100 h-100 d-inline-block m-1"
            variant="warning"
            href="/AdminShiftScreen"
          >
            Admin Shift Screen
          </Button>
        </MDBCol>
        <MDBCol sm="6" md="3" lg="2" xl="2">
          <Button
            className="w-100 h-100 d-inline-block m-1"
            variant="danger"
            href="/rosterAdmin"
          >
            Roster Admin
          </Button>
        </MDBCol>
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
            variant="warning"
            href="/ViewRosterScreen2"
          >
            View Roster Screen 2
          </Button>
        </MDBCol>
        <MDBCol sm="6" md="3" lg="2" xl="2">
          <Button
            className="w-100 h-100 d-inline-block m-1"
            variant="danger"
            href="/CreateRosterScreen"
          >
            Create Roster
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
        <MDBCol sm="6" md="3" lg="2" xl="2">
          <Button
            className="w-100 h-100 d-inline-block m-1"
            variant="danger"
            href="/wages"
          >
            View Wage Reports
          </Button>
        </MDBCol>
      </MDBRow>
    );
  }
}

export default LeftSidebar;

import React from "react";
import Button from "react-bootstrap/Button";
import { MDBRow, MDBCol } from "mdbreact";
class LeftSidebar extends React.Component {
  render() {
    return (
      <MDBRow center className="m-1">
        <MDBCol sm="6" md="4" lg="1" xl="2">
          <Button
            variant="primary"
            href="/StaffListScreen"
            className="w-100 h-100 d-inline-block m-1"
          >
            Add Staff
          </Button>
        </MDBCol>
        <MDBCol sm="6" md="4" lg="1" xl="2">
          <Button
            className="w-100 h-100 d-inline-block m-1"
            variant="warning"
            href="#"
          >
            Update Staff
          </Button>
        </MDBCol>
        <MDBCol sm="6" md="4" lg="1" xl="2">
          <Button
            className="w-100 h-100 d-inline-block m-1"
            variant="danger"
            href="#"
          >
            Delete Staff
          </Button>
        </MDBCol>
        <MDBCol sm="6" md="4" lg="1" xl="2">
          <Button
            className="w-100 h-100 d-inline-block m-1"
            variant="primary"
            href="/ViewRosterScreen"
          >
            View Roster
          </Button>
        </MDBCol>
        <MDBCol sm="6" md="4" lg="1" xl="2">
          <Button
            className="w-100 h-100 d-inline-block m-1"
            variant="warning"
            href="#"
          >
            Update Roster
          </Button>
        </MDBCol>
        <MDBCol sm="6" md="4" lg="1" xl="2">
          <Button
            className="w-100 h-100 d-inline-block m-1"
            variant="danger"
            href="/CreateRosterScreen"
          >
            Create Roster
          </Button>
        </MDBCol>
        <MDBCol sm="6" md="4" lg="1" xl="2">
          <Button
            className="w-100 h-100 d-inline-block m-1"
            variant="danger"
            href="/PublicHolidays"
          >
            Public Holidays
          </Button>
        </MDBCol>
      </MDBRow>
    );
  }
}

export default LeftSidebar;

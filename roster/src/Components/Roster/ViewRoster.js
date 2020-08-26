// import React from "react";
import React from "react";
import { MDBRow, MDBCol, MDBInput, MDBBtn } from "mdbreact";

function ViewRoster({}) {
  return (
    <MDBRow center>
      <MDBCol sm="12" md="2" lg="1" xl="1" className="grey-text">
        <MDBBtn color="secondary" href="/ViewSavedRoster">
          Closed Roster
        </MDBBtn>
      </MDBCol>
      <MDBCol sm="12" md="2" lg="1" xl="1" className="grey-text">
        <MDBBtn color="secondary" href="viewWeeklyRoster">
          Finalised Roster
        </MDBBtn>
      </MDBCol>
      <MDBCol sm="12" md="2" lg="1" xl="1" className="grey-text">
        <MDBBtn color="secondary" href="/ViewSavedRoster">
          Saved Roster
        </MDBBtn>
      </MDBCol>
    </MDBRow>
  );
}

export default ViewRoster;

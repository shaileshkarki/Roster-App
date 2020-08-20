import React from "react";
import { MDBContainer } from "mdbreact";
import "./StaffNewScreen.css";
import StaffForm from "./StaffForm";

function StaffEditScreen({ location }) {
  return (
    <div>
      <MDBContainer className="staff-new-form border border-light p-5">
        <StaffForm data={location.state} />
      </MDBContainer>
    </div>
  );
}

export default StaffEditScreen;

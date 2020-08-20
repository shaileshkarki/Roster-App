import React, { useState } from "react";
import { MDBContainer } from "mdbreact";
import "./StaffNewScreen.css";
import StaffForm from "./StaffForm";

function StaffNewScreen(props) {
  return (
    <div>
      <MDBContainer className="staff-new-form border border-light p-5">
        <StaffForm />
      </MDBContainer>
    </div>
  );
}

export default StaffNewScreen;

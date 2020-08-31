import React from "react";
import { MDBContainer } from "mdbreact";
import "./StaffNewScreen.css";
import StaffForm from "./StaffForm";

function StaffEditScreen({ location }) {
  return (
    <div>
      <StaffForm data={location.state} />
    </div>
  );
}

export default StaffEditScreen;

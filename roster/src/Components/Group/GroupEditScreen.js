import React from "react";
import { MDBContainer } from "mdbreact";
import "../StaffNewScreen.css";
import GroupForm from "./GroupForm";

function GroupEditScreen({ location }) {
  return (
    <div>
      <GroupForm data={location.state} />
    </div>
  );
}

export default GroupEditScreen;

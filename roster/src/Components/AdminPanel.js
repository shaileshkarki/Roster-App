import React from "react";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Button from "react-bootstrap/Button";
import LeftSidebar from "./LeftSidebar";
import ReportsFooter from "./ReportsFooter";
import MiddleContainer from "./MiddleContainer";
import { MDBContainer, MDBRow, MDBCol } from "mdbreact";
function AdminPanel(props) {
  return (
    <div>
      <MDBRow center>
        <MDBCol>
          <LeftSidebar />
        </MDBCol>
      </MDBRow>
      <MDBRow>
        <MDBCol></MDBCol>
      </MDBRow>
    </div>
  );
}

export default AdminPanel;

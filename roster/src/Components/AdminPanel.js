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
        // <div>
        //   <div class="container-fluid text-center">
        //     <LeftSidebar />
        //     {/* <MiddleContainer /> */}
        //     <div class="col-sm-10 text-left">
        //       <p>Actual login content goes here</p>
        //       <h1>PLACE MAIN SCREEN HERE</h1>
        //       <p>This is where the main action will occur</p>
        //     </div>
        //   </div>
        //   <ReportsFooter />
        // </div>
        <div>
            <LeftSidebar />
            <MDBRow>{/* <MDBCol size="12" sm="12"></MDBCol> */}</MDBRow>

            <MDBRow>
                <MDBCol size="12" sm="8"></MDBCol>
            </MDBRow>
        </div>
    );
}

export default AdminPanel;

import React from "react";
import { Jumbotron } from "react-bootstrap";
import { MDBTypography } from "mdbreact";
class Home extends React.Component {
  render() {
    return (
      <div>
        <MDBTypography tag="h1" variant="h1-responsive">
          Welcome to Roster Application
        </MDBTypography>
        <Jumbotron className="jumbotron-home">
          <MDBTypography note noteColor="success" noteTitle="">
            Roster application enables small business owners to roster and
            manage their staff efficiently. It has the ability to create staff,
            staff roles, hourly rates and financial report to help manage the
            business.
          </MDBTypography>

          <div>
            <img
              style={{ height: "50%", width: "50%", textAlign: "center" }}
              src="../images/roster-app-logo.jpg"
              className="img-fluid"
              alt=""
            />
          </div>
        </Jumbotron>
      </div>
    );
  }
}

export default Home;

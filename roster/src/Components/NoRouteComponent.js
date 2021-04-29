import React from "react";
import { Jumbotron } from "react-bootstrap";
import { MDBTypography } from "mdbreact";
class NoRouteComponent extends React.Component {
  render() {
    return (
      <Jumbotron className="jumbotron-home">
        <MDBTypography note noteColor="danger" noteTitle="Page Not Found: ">
          <p>Please try other routes or links.</p>
        </MDBTypography>
      </Jumbotron>
    );
  }
}

export default NoRouteComponent;

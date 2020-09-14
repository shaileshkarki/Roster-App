import React from "react";
import { Jumbotron, Row, Col, Image, Button } from "react-bootstrap";

class Home extends React.Component {
  render() {
    return (
      <div>
        <h1>Welcome to Roster Application</h1>
        <Jumbotron className="jumbotron-home">
          <div>
            <p>
              Roster application enables small business owners to roster and
              manage their staff efficiently. It has the ability to create
              staff, staff roles, hourly rates and financial report to help
              manage the business.
            </p>
          </div>
          <div>
            <img
              style={{ height: "50%", width: "50%", textAlign: "center" }}
              src="../images/roster-app-logo.jpg"
              alt=""
            />
          </div>
        </Jumbotron>
      </div>
    );
  }
}

export default Home;

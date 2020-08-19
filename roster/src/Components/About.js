import React from "react";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";

class About extends React.Component {
  render() {
    return (
      <div
        style={{
          display: "flex",
          alignItems: "center",
          flexDirection: "column",
          justifyContent: "center",
        }}
      >
        <div
          style={{
            textAlign: "left",
            width: "50%",
            margin: "0 25%",
          }}
        >
          <h1>Features for the users. </h1>
          <ul>
            <li>
              It allows a user to register, login and search their shifts{" "}
            </li>
            <li>Allows user to put in availability for upcoming roster</li>
            <li>
              Allows rostering manager to create roster allocating shifts to
              staff
            </li>
          </ul>
        </div>
        <div
          style={{
            textAlign: "left",
            width: "50%",
            margin: "0 25%",
          }}
        >
          <h1>Features about the application:</h1>
          <ul>
            <li>
              Technologis used: Javascript,React, CSS/HTML, Node, Express and
              Postgres SQL
            </li>
            <li>Passwords are hashed prior before database storing.</li>
            <li>Axios utilsed for processing RESTFUL API requests</li>
            <li>MDB utilised for GUI</li>
          </ul>
        </div>
      </div>
    );
  }
}

export default About;

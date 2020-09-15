import React from "react";
import { MDBRow, MDBCol, MDBTypography } from "mdbreact";
class About extends React.Component {
  render() {
    return (
      <MDBRow center>
        <MDBCol sm="12" md="8">
          <div className="border border-light p-5 md-6">
            <MDBTypography
              note
              noteColor="info"
              noteTitle="Features for the users:"
            >
              <p>
                It allows a user to register, login and search their shifts{" "}
              </p>
              <p>Allows user to put in availability for upcoming roster</p>
              <p>
                Allows rostering manager to create roster allocating shifts to
                staff
              </p>
            </MDBTypography>
            <MDBTypography
              note
              noteColor="info"
              noteTitle="Features about the application:"
            >
              <p>
                Technologis used: Javascript,React, CSS/HTML, Node, Express and
                Postgres SQL
              </p>
              <p>Passwords are hashed prior before database storing.</p>
              <p>Axios utilsed for processing RESTFUL API requests</p>
              <p>MDB utilised for GUI</p>
            </MDBTypography>
          </div>
        </MDBCol>
      </MDBRow>
    );
  }
}

export default About;

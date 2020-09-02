// import React from "react";
import React, { useEffect, useState } from "react";
import { MDBRow, MDBCol, MDBInput, MDBBtn } from "mdbreact";
import { Button } from "react-bootstrap";
import useApi from "../../hooks/useApi";
import LeftSidebar from "../LeftSidebar";

function ViewRoster({}) {
  const { data: rosters, request: getRosters } = useApi(
    "http://localhost:9000/roster/allRosters"
  );
  useEffect(() => {
    getRosters();
  }, []);
  return (
    <MDBRow center>
      <MDBRow center>
        <MDBCol sm="12" md="12" lg="12" xl="12">
          <LeftSidebar />
        </MDBCol>
      </MDBRow>
      <MDBCol sm="12" className="grey-text">
        <MDBBtn variant="danger" disabled>
          Fianlised Roster
        </MDBBtn>
      </MDBCol>
      <MDBCol sm="12" className="grey-text">
        {rosters.map((roster) =>
          roster.status == "Finalised" ? (
            <MDBBtn
              variant="primary"
              href={`/viewWeeklyRoster/${roster.roster_id}`}
            >
              {roster.title}
            </MDBBtn>
          ) : (
            ""
          )
        )}
      </MDBCol>

      <MDBCol sm="12" className="grey-text">
        <MDBBtn variant="danger" disabled>
          Open Roster
        </MDBBtn>
      </MDBCol>
      <MDBCol sm="12" className="grey-text">
        {rosters.map((roster) =>
          roster.status == "Open" ? (
            <MDBBtn
              variant="warning"
              href={`/viewWeeklyRoster/${roster.roster_id}`}
            >
              {roster.title}
            </MDBBtn>
          ) : (
            ""
          )
        )}
      </MDBCol>

      <MDBCol sm="12" className="grey-text">
        <MDBBtn disabled>Closed Roster</MDBBtn>
      </MDBCol>
      <MDBCol sm="12" className="grey-text">
        {rosters.map((roster) =>
          roster.status == "Closed" ? (
            <MDBBtn
              variant="primary"
              href={`/viewWeeklyRoster/${roster.roster_id}`}
            >
              {roster.title}
            </MDBBtn>
          ) : (
            ""
          )
        )}
      </MDBCol>
    </MDBRow>
  );
}

export default ViewRoster;

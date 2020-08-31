// import React from "react";
import React, { useEffect, useState } from "react";
import { MDBRow, MDBCol, MDBInput, MDBBtn } from "mdbreact";
import useApi from "../../hooks/useApi";

function ViewRoster({}) {
  const { data: rosters, request: getRosters } = useApi(
    "http://localhost:9000/roster/allRosters"
  );
  useEffect(() => {
    getRosters();
  }, []);
  return (
    <MDBRow center>
      <MDBCol sm="12" className="grey-text">
        <MDBBtn disabled>Fianlised Roster</MDBBtn>
      </MDBCol>
      <MDBCol sm="12" className="grey-text">
        {rosters.map((roster) =>
          roster.status == "Finalised" ? (
            <MDBBtn color="secondary" href="/viewWeeklyRoster">
              {roster.title}
            </MDBBtn>
          ) : (
            ""
          )
        )}
      </MDBCol>

      <MDBCol sm="12" className="grey-text">
        <MDBBtn disabled>Open Roster</MDBBtn>
      </MDBCol>
      <MDBCol sm="12" className="grey-text">
        {rosters.map((roster) =>
          roster.status == "Open" ? (
            <MDBBtn
              color="secondary"
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
              color="secondary"
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

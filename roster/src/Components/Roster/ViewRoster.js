// import React from "react";
import React, { useEffect, useState } from "react";
import { MDBRow, MDBCol, MDBInput, MDBBtn } from "mdbreact";
import { Button, ThemeProvider } from "react-bootstrap";
import useApi from "../../hooks/useApi";
import LeftSidebar from "../LeftSidebar";
import {
  MDBDropdown,
  MDBDropdownToggle,
  MDBDropdownMenu,
  MDBDropdownItem,
} from "mdbreact";

function ViewRoster({}) {
  const { data: rosters, request: getRosters } = useApi("/roster/allRosters");
  useEffect(() => {
    getRosters();
  }, []);

  let statusArray = [];
  rosters.map((roster) => {
    if (!statusArray.includes(roster.status)) {
      statusArray.push(roster.status);
    }
  });
  return (
    <MDBRow center>
      <MDBRow center>
        <MDBCol sm="12" md="12" lg="12" xl="12">
          <LeftSidebar />
        </MDBCol>

        <MDBCol sm="12" md="12" lg="12" xl="12">
          <MDBRow center>
            {statusArray.map((status) => (
              <MDBCol sm="2" className="grey-text">
                <MDBDropdown>
                  <MDBDropdownToggle caret color="primary">
                    {status}
                  </MDBDropdownToggle>
                  <MDBDropdownMenu basic>
                    {rosters.map((roster) =>
                      roster.status == status ? (
                        <MDBDropdownItem
                          href={`/viewWeeklyRoster/${roster.roster_id}`}
                        >
                          {roster.title}
                        </MDBDropdownItem>
                      ) : (
                        ""
                      )
                    )}
                  </MDBDropdownMenu>
                </MDBDropdown>
              </MDBCol>
            ))}
          </MDBRow>
        </MDBCol>
      </MDBRow>
    </MDBRow>
  );
}
export default ViewRoster;
//select roster_id, from roster group by status order by roster_id;

//href={`/viewWeeklyRoster/${roster.roster_id}`}

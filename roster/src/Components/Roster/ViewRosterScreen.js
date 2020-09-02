import React, { useState, useEffect } from "react";
import {
  MDBDropdown,
  MDBDropdownToggle,
  MDBDropdownMenu,
  MDBDropdownItem,
  MDBBtnGroup,
} from "mdbreact";

import { Button } from "react-bootstrap";
import useApi from "../../hooks/useApi";
import Roster from "./Roster";
import moment from "moment";

function ViewRosterScreen(props) {
  const [weekNumber, setWeekNumber] = useState(1);
  const [shifts, setShifts] = useState([]);
  const { data: weekNumbersFromDatabase, request: getWeekNumbers } = useApi(
    "http://localhost:9000/roster/weeks"
  );
  const { data: groups, request: getAllGroups } = useApi(
    "http://localhost:9000/groups"
  );

  const { data: shiftsFromDatabase, request: getShifts } = useApi(
    `http://localhost:9000/roster/shifts/${weekNumber}`
  );

  const [displayRoster, setDisplayRoster] = useState(false);

  const loadData = async () => {
    const { data } = await getWeekNumbers();
    setWeekNumber(data[0].week_number);
    const shiftsData = await getShifts();
    console.log("shift data ", shiftsData);
    setShifts(shiftsData.data);
  };
  useEffect(() => {
    loadData();
    getAllGroups();
    console.log("datae", moment(1598310000000000));
  }, []);
  console.log("shifts length ", shifts.length);
  return (
    <div>
      View Roster Screen
      <MDBBtnGroup>
        <MDBDropdown>
          <Button className="btn btn-primary mr-0">
            {" "}
            {displayRoster ? weekNumber : "Select Week"}
          </Button>
          <MDBDropdownToggle caret color="primary" />
          <MDBDropdownMenu color="primary">
            {weekNumbersFromDatabase.map((week, index) => (
              <MDBDropdownItem
                key={index}
                onMouseLeave={async () => {
                  let { data } = await getShifts();
                  setShifts(data);
                  setDisplayRoster(true);
                }}
                onClick={(e) => {
                  setDisplayRoster(false);
                  setWeekNumber(week.week_number);
                }}
              >
                {week.week_number}
              </MDBDropdownItem>
            ))}
          </MDBDropdownMenu>
        </MDBDropdown>
      </MDBBtnGroup>
      {displayRoster && (
        <Roster
          shifts={shifts}
          groups={groups}
          weekNumber={weekNumber}
          create={false}
        />
      )}
    </div>
  );
}

export default ViewRosterScreen;

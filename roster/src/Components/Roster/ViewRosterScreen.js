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
  const [rosterPeriodDates, setRosterPeriodDates] = useState({});
  const { data: weekNumbersFromDatabase, request: getWeekNumbers } = useApi(
    "roster/weeks"
  );
  const { data: groups, request: getAllGroups } = useApi(`groups`);

  const { data: shiftsFromDatabase, request: getShifts } = useApi(
    `roster/shifts/${weekNumber}`
  );

  const { request: getRosterPeriodDates } = useApi(
    `roster/dates/${weekNumber}`
  );

  const [displayRoster, setDisplayRoster] = useState(false);

  const loadData = async () => {
    const { data } = await getWeekNumbers();
    setWeekNumber(data[0].week_number);
    const shiftsData = await getShifts();
    const rosterPeriodData = await getRosterPeriodDates();

    setShifts(shiftsData.data);
    setRosterPeriodDates(rosterPeriodData.data[0]);
  };
  useEffect(() => {
    loadData();
    getAllGroups();

    console.log("date", moment(1598310000000000));
  }, []);
  console.log("shifts length ", shifts.length);
  console.log("roster period data" + rosterPeriodDates.start_date);
  return (
    <div>
      <h2>Edit Roster</h2>
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
                  let rosterPeriods = await getRosterPeriodDates();

                  setRosterPeriodDates(rosterPeriods.data[0]);
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
          startDate={rosterPeriodDates.start_date}
          endDate={rosterPeriodDates.end_date}
          title={rosterPeriodDates.title}
        />
      )}
    </div>
  );
}

export default ViewRosterScreen;

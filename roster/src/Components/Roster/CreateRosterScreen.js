import React, { useState, useEffect } from "react";
import { MDBRow, MDBCol, MDBInput, MDBContainer } from "mdbreact";
import useApi from "../../hooks/useApi";
import { Button } from "react-bootstrap";

import axios from "axios";
import { useHistory } from "react-router-dom";
import {
  invalidEmailMsg,
  invalidMinMaxMsg,
  invalidNumber,
} from "../../lib/formValidation";

import moment from "moment";

const colours = ["red", "yellow", "blue", "green", "orange", "purple"];
const createNext15MinuteTime = () => {
  let minutes15 = moment();
  minutes15 = Math.round(minutes15.minutes() / 15) * 15;
  let newStartTime = moment().minutes(minutes15);

  // console.log(newStartTime.toLocaleString());
  return newStartTime;
};

function CreateRosterScreen(props) {
  const { data: groups, request: getAllGroups } = useApi(
    "http://localhost:9000/groups"
  );
  const { data: weekNumberFromDatabase, request: getWeekNumber } = useApi(
    "http://localhost:9000/roster/weeknumber"
  );
  const [selectedGroup, setSelectedGroup] = useState({});
  const [numberOfShifts, setNumberOfShifts] = useState([]);
  const [weekNumber, setWeekNumber] = useState(
    weekNumberFromDatabase.weekNumber
  );

  let history = useHistory();

  useEffect(() => {
    getAllGroups();
    getWeekNumber();
    console.log(weekNumberFromDatabase);
    let a = moment.unix(1598346000);
    let b = a.unix();
    console.log("aaa", a);
  }, []);
  console.log(2);
  console.log(groups);
  const createShifts = (numberOfShifts) => {
    const groupsWithShifts = Object.keys(numberOfShifts);
    let shifts = [];
    groupsWithShifts.forEach((groupName, index) => {
      const shiftCount = numberOfShifts[groupName];
      let groupId;
      let minDuration;
      console.log(groupName);
      console.log(groups);
      for (let j = 0; j < groups.length; j++) {
        if (groups[j].title === groupName) {
          groupId = groups[j].id;
          minDuration = groups[j].group_duration;
          console.log("true condition");
          break;
        }
      }
      const itemStyles = {
        borderRadius: "5px",
      };
      for (let i = 0; i < shiftCount; i++) {
        let shift = {
          id: index + 1,
          group: groupId,
          title: "Unallocated",
          weekNumber: weekNumber,
          start_time: createNext15MinuteTime().add(4, "hour").unix(),
          end_time: createNext15MinuteTime()
            .add(4 + minDuration, "hour")
            .unix(),
          canMove: true,
          canResize: true,
          itemProps: {
            style: itemStyles,
          },
          staffId: 1,
          isallocated: true,
        };
        shifts.push(shift);
      }
    });

    return shifts;
  };
  const handleNumberOfShiftChange = (e) => {
    console.log(e.target.name);
    let newNumberOfShifts = { ...numberOfShifts };
    newNumberOfShifts[e.target.name] = e.target.value;
    setNumberOfShifts(newNumberOfShifts);
  };

  const handleWeekNumberChange = (e) => {
    setWeekNumber(e.target.value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    let shifts = createShifts(numberOfShifts);
    console.log("shifts = " + shifts);
    history.push("/ViewRoster", [
      shifts,
      groups,
      weekNumberFromDatabase.weekNumber,
    ]);
    // history.push("/ViewRosterScreen", [...shifts]);
  };
  return (
    <div>
      {console.log(3)}
      <p className="text-center h4  mb-4">Create Roster</p>
      <MDBRow center>
        <MDBCol sm="12" md="6" lg="5" className="grey-text">
          <form
            onSubmit={handleSubmit}
            className="staff-new-form border border-light p-5"
          >
            <MDBRow center>
              <MDBCol sm="12" md="9" lg="7">
                {" "}
                <MDBInput
                  size="lg"
                  className="grey-text"
                  label={"Week Number"}
                  icon="calendar"
                  // id={group.group_id}
                  group
                  type="text"
                  validate
                  error="wrong"
                  success="right"
                  required
                  name={"weekNumber"}
                  minLength="1"
                  maxLength="4"
                  onChange={handleWeekNumberChange}
                  onInvalid={(e) => invalidNumber(e, 1, 2)}
                  onInput={(e) => invalidNumber(e, 1, 2)}
                  autoComplete="new-password"
                  value={weekNumberFromDatabase.weekNumber}
                  disabled
                />
              </MDBCol>
            </MDBRow>

            {groups.map((group, index) => (
              <MDBRow center>
                <MDBCol key={index} sm="12" md="9" lg="7">
                  <MDBInput
                    size="lg"
                    className="grey-text"
                    label={`${group.title} Number Of Shifts`}
                    icon="users"
                    // id={group.group_id}
                    group
                    type="text"
                    validate
                    error="wrong"
                    success="right"
                    required
                    name={group.title}
                    minLength="1"
                    maxLength="2"
                    onChange={handleNumberOfShiftChange}
                    onInvalid={(e) => invalidNumber(e, 1, 2)}
                    onInput={(e) => invalidNumber(e, 1, 2)}
                    autoComplete="new-password"
                    // value={}
                  />
                </MDBCol>
              </MDBRow>
            ))}

            <Button
              type="submit"
              value="Submit"
              className="btn btn-primary my-3 btn-block mr-2"
            >
              {"Create Roster"}
            </Button>
            <Button className="btn btn-primary my-3 btn-block" href="/admin">
              Back
            </Button>
          </form>
        </MDBCol>
      </MDBRow>
    </div>
  );
}

export default CreateRosterScreen;

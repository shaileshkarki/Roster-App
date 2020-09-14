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

import {
    DatePicker,
    TimePicker,
    DateTimePicker,
    MuiPickersUtilsProvider,
    KeyboardDatePicker,
} from "@material-ui/pickers";
import DateFnsUtils from "@date-io/date-fns";

import moment from "moment";

function CreateRosterScreen(props) {
    const createNext15MinuteTime = () => {
        console.log(
            "test",
            moment.unix(Math.round(startDate.getTime() / 1000))
        );
        let startTime = moment.unix(Math.round(startDate.getTime() / 1000));
        let rounding = Math.round(startTime.minutes() / 15) * 15;
        startTime.minutes(rounding);

        // console.log(newStartTime.toLocaleString());
        return startTime;
    };
    const { data: groups, request: getAllGroups } = useApi(`groups`);
    const { data: weekNumberFromDatabase, request: getWeekNumber } = useApi(
        `roster/weeknumber`
    );
    const [selectedGroup, setSelectedGroup] = useState({});
    const [numberOfShifts, setNumberOfShifts] = useState([]);
    const [weekNumber, setWeekNumber] = useState(
        weekNumberFromDatabase.weekNumber
    );
    const [startDate, setStartDate] = useState(new Date());
    const [endDate, setEndDate] = useState(
        new Date(new Date().setDate(new Date().getDate() + 6))
    );

    const [title, setTitle] = useState(weekNumberFromDatabase.weekNumber);

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
                    start_time: createNext15MinuteTime().add("hour").unix(),
                    end_time: createNext15MinuteTime()
                        .add(minDuration, "hour")
                        .unix(),
                    canMove: true,
                    canResize: true,
                    itemProps: {
                        style: itemStyles,
                    },
                    staff_id: 1,
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
    const handleTitleChange = (e) => {
        setTitle(e.target.value);
    };
    const handleSubmit = (e) => {
        e.preventDefault();
        if (startDate.getTime() >= endDate.getTime()) {
            return;
        }
        let shifts = createShifts(numberOfShifts);
        console.log("shifts = " + shifts);
        history.push("/ViewRoster", [
            shifts,
            groups,
            weekNumberFromDatabase.weekNumber,
            startDate.toISOString().slice(0, 10),
            endDate.toISOString().slice(0, 10),
            title,
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
                        <MDBRow center>
                            <MDBCol sm="12" md="9" lg="7">
                                {" "}
                                <MDBInput
                                    size="lg"
                                    label={"Title"}
                                    icon="calendar"
                                    group
                                    type="text"
                                    validate
                                    error="wrong"
                                    success="right"
                                    required
                                    name={"title"}
                                    minLength="1"
                                    maxLength="50"
                                    onChange={handleTitleChange}
                                    onInvalid={(e) =>
                                        invalidMinMaxMsg(e, 1, 50)
                                    }
                                    onInput={(e) => invalidMinMaxMsg(e, 1, 50)}
                                    autoComplete="new-password"
                                    value={title}
                                />
                            </MDBCol>
                        </MDBRow>
                        <MDBRow center>
                            <MDBCol sm="12" md="9" lg="7">
                                <MuiPickersUtilsProvider utils={DateFnsUtils}>
                                    <DatePicker
                                        value={startDate}
                                        onChange={setStartDate}
                                        format="do MMMM yyyy"
                                        size="lg"
                                        label="Start Date"
                                        required
                                        validate
                                        minDate={new Date()}
                                    />
                                </MuiPickersUtilsProvider>
                            </MDBCol>
                        </MDBRow>
                        <MDBRow center>
                            <MDBCol sm="12" md="9" lg="7">
                                <MuiPickersUtilsProvider utils={DateFnsUtils}>
                                    <DatePicker
                                        value={endDate}
                                        onChange={setEndDate}
                                        format="do MMMM yyyy"
                                        size="lg"
                                        label="End Date"
                                        required
                                        validate
                                        minDateMessage="End Date should be later than Start Date"
                                        minDate={new Date(startDate).setDate(
                                            startDate.getDate() + 1
                                        )}
                                    />
                                </MuiPickersUtilsProvider>
                            </MDBCol>
                        </MDBRow>
                        {groups.map((group, index) => (
                            <MDBRow key={index} center>
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
                                        onInvalid={(e) =>
                                            invalidNumber(e, 1, 2)
                                        }
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
                        <Button
                            className="btn btn-primary my-3 btn-block"
                            href="/admin"
                        >
                            Back
                        </Button>
                    </form>
                </MDBCol>
            </MDBRow>
        </div>
    );
}

export default CreateRosterScreen;

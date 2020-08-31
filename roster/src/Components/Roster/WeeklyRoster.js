import React, { useEffect, useState } from "react";
import { useHistory } from "react-router-dom";
import useStaffApi from "../../hooks/useStaffApi";
import useApi from "../../hooks/useApi";
import Table from "react-bootstrap/Table";
import LeftSidebar from "../LeftSidebar";
import ReportsFooter from "../ReportsFooter";
import { MDBContainer, MDBRow, MDBCol, MDBTable } from "mdbreact";

import Pagination from "react-bootstrap-4-pagination";
import { SplitButton, Dropdown, ButtonGroup, Button } from "react-bootstrap";
import { paginate } from "../../lib/pagination";

import "../StaffListScreen.css";

const weekInfo = {
  weekStart: "Wed Aug 26 2020",
  duration: 7,
};
const defaultItems = [
  {
    id: 12,
    group: 1,
    staff_name: "Nick",
    start_time: "7:00",
    end_time: "17:00",
    date: "Sun Aug 30 2020",
  },
  {
    id: 1,
    group: 1,
    staff_name: "John",
    start_time: "17:00",
    end_time: "20:15",
    date: "Wed Aug 26 2020",
  },
  {
    id: 2,
    group: 1,
    staff_name: "John",
    start_time: "17:00",
    end_time: "20:15",
    date: "Thu Aug 27 2020",
  },
  {
    id: 3,
    group: 1,
    staff_name: "John",
    start_time: "17:00",
    end_time: "20:15",
    date: "Fri Aug 28 2020",
  },
  {
    id: 4,
    group: 1,
    staff_name: "John",
    start_time: "17:00",
    end_time: "20:15",
    date: "Sat Aug 29 2020",
  },
  {
    id: 5,
    group: 1,
    staff_name: "John",
    start_time: "17:00",
    end_time: "20:15",
    date: "Sun Aug 30 2020",
  },
  {
    id: 6,
    group: 1,
    staff_name: "John",
    start_time: "12:00",
    end_time: "20:15",
    date: "Mon Aug 31 2020",
  },

  {
    id: 9,
    group: 1,
    staff_name: "Nick",
    start_time: "7:00",
    end_time: "14:00",
    date: "Thu Aug 27 2020",
  },
  {
    id: 10,
    group: 1,
    staff_name: "Nick",
    start_time: "7:00",
    end_time: "15:00",
    date: "Fri Aug 28 2020",
  },

  {
    id: 11,
    group: 1,
    staff_name: "Nick",
    start_time: "7:00",
    end_time: "15:00",
    date: "Sat Aug 29 2020",
  },

  {
    id: 13,
    group: 1,
    staff_name: "Nick",
    start_time: "7:00",
    end_time: "15:00",
    date: "Mon Aug 31 2020",
  },
  {
    id: 8,
    group: 1,
    staff_name: "Nick",
    start_time: "7:00",
    end_time: "15:00",
    date: "Wed Aug 26 2020",
  },

  {
    id: 16,
    group: 1,
    staff_name: "Aron",
    start_time: "10:00",
    end_time: "17:00",
    date: "Tue Sep 01 2020",
  },
  {
    id: 15,
    group: 1,
    staff_name: "Aron",
    start_time: "12:00",
    end_time: "18:00",
    date: "Wed Aug 26 2020",
  },
  {
    id: 17,
    group: 1,
    staff_name: "Josh",
    start_time: "13:00",
    end_time: "16:00",
    date: "Wed Aug 26 2020",
  },

  {
    id: 18,
    group: 1,
    staff_name: "Josh",
    start_time: "8:00",
    end_time: "19:00",
    date: "Tue Sep 01 2020",
  },
  {
    id: 19,
    group: 1,
    staff_name: "Josh",
    start_time: "12:00",
    end_time: "18:00",
    date: "Wed Aug 27 2020",
  },
];
const convertTime = function (timeInString) {
  let temp = timeInString.split(":");
  let hour = Number(temp[0]);
  let minutes = Number(temp[1]) / 60;
  return hour + minutes;
};

const calculateBreak = function (shiftStartTime, shiftEndTime) {
  let startTime = convertTime(shiftStartTime);
  let endTime = convertTime(shiftEndTime);
  let shiftLength = endTime - startTime;
  if (shiftLength <= 3.5) {
    return 0;
  } else if (shiftLength > 3.5 && shiftLength <= 5) {
    return 0.25;
  } else if (shiftLength > 5 && shiftLength <= 8) {
    return 0.5;
  } else {
    return 1;
  }
};

//sorting an array based on alphabetical order of staff_name
defaultItems.sort((a, b) => {
  let fa = a.staff_name.toLowerCase(),
    fb = b.staff_name.toLowerCase();

  if (fa < fb) {
    return -1;
  }
  if (fa > fb) {
    return 1;
  }
  return 0;
});
const searchByCriteraiList = [
  // { label: "ID", key: "date" },
  // { label: "First Name", key: "firstname" },
  // { label: "Last Name", key: "lastname" },
  // { label: "Address", key: "address" },
  // { label: "City", key: "city" },
  // { label: "State", key: "state" },
  // { label: "Post Code", key: "postcode" },
  // { label: "Email", key: "email" },
];
function WeeklyRoster(props) {
  const { data: shifts, request: getShifts } = useApi(
    `http://localhost:9000/roster/${props.match.params.rosterID}`
  );
  //Added back code:
  const { request: getAllActiveStaffList } = useStaffApi();
  const [allStaffList, setAllStaffList] = useState([]); // All staff from database
  const [filteredStaffList, setFilteredStaffList] = useState([]); // All staff that meet seacrh criteria
  const [searchCriteria, setSearchCriteria] = useState(searchByCriteraiList[0]);
  const [searchCriteriaValue, setSearchCriteriaValue] = useState("");
  const [paginationData, setPaginationData] = useState([]); // Staff to  be displayed on screen depending on how many per page
  const [total, setTotal] = useState(0); // Sum of total staff listed on screen
  const [current, setCurrent] = useState(0); // Displaying value of 1st staff member on screen (ie 1 of 5)
  const [currentPage, setCurrentPage] = useState(0); // Current page of pagination
  const [numberOfStaffPerPage, setNumberOfStaffPerPage] = useState(20); // How many staff members to display per screen (pagination)
  let history = useHistory();

  const changeNumberOfItemsPerPage = (e) => {
    setNumberOfStaffPerPage(Number(e.target.value));
    //if (e.target.value === "") return;

    setScreen(
      filteredStaffList.length > 0 ? filteredStaffList : allStaffList,
      filteredStaffList.length > 0 ? true : false,
      Number(e.target.value)
    );
  };
  // set up the page to display Staff List and pagination.
  const loadStaffListScreen = async () => {
    const { data } = await getAllActiveStaffList();
    setAllStaffList(data);
    setScreen(data, false, numberOfStaffPerPage);
  };

  const setScreen = (data, isFiltered, number) => {
    console.log("Number of staff per page = ", number);
    setFilteredStaffList(isFiltered ? data : []);
    setTotal(data.length);
    setCurrent(data.length > 0 ? 1 : 0);
    setCurrentPage(0);
    setPaginationData(paginate(data, 0, number));
  };

  const getFilteredStaff = (criteria) => {
    return allStaffList.filter((staffMember) => {
      if (
        String(staffMember[searchCriteria.key])
          .toLowerCase()
          .includes(criteria.toLowerCase())
      )
        return staffMember;
      return "";
    });
  };

  // Return List of staff that meet search criteria
  const searchForStaffMember = (e) => {
    setSearchCriteriaValue(e.target.value);
    if (e.target.value === "") {
      setScreen(allStaffList, false, numberOfStaffPerPage);
      return;
    }
    setScreen(getFilteredStaff(e.target.value), true, numberOfStaffPerPage);
  };

  useEffect(() => {
    getShifts();
  }, []);
  console.log(shifts);
  // Added back code :
  let paginationConfig = {
    totalPages:
      numberOfStaffPerPage > 0 ? Math.ceil(total / numberOfStaffPerPage) : 0,
    currentPage: currentPage + 1,
    showMax: 20,
    prevNext: true,
    activeBgColor: "dogerblue",
    activeBorderColor: "dogerblue",
    color: "dodgerblue",
    onClick: function (page) {
      if (page !== currentPage + 1) {
        setCurrentPage(page - 1);
        setPaginationData(
          paginate(
            filteredStaffList.length > 0 ? filteredStaffList : allStaffList,
            page - 1,
            numberOfStaffPerPage
          )
        );
        setCurrent(page === 1 ? 1 : (page - 1) * numberOfStaffPerPage + 1);
      }
    },
  };
  // for (var i = 0; i < weekInfo.duration; i++) {
  //   var date = new Date(weekInfo.weekStart);
  //   date.setDate(date.getDate() + i);
  //   tableHeader.push(<th>{date.toDateString()}</th>);
  // }
  const tableHeader = [];
  let count = 0;
  Object.values(shifts).map((shift_, index1) => {
    shift_.map((shift, index) => {
      if (index1 === 0 && index == 0) {
        let weekStart = new Date(shift.week_start);
        let weekEnd = new Date(shift.week_end);
        let rosterPeriod = (weekEnd - weekStart) / 1000 / 60 / 60 / 24;
        // console.log(rosterPeriod);
        for (let i = 0; i <= rosterPeriod; i++) {
          count++;
          let nextDay = new Date(weekStart);
          nextDay.setDate(nextDay.getDate() + i);
          tableHeader.push(<th>{nextDay.toDateString()}</th>);
        }
      }
    });
  });
  console.log({ count });

  const uniqueStaff = [];
  for (var i = 0; i < defaultItems.length; i++) {
    if (!uniqueStaff.includes(defaultItems[i].staff_name))
      uniqueStaff.push(defaultItems[i].staff_name);
  }

  let blankDate = {
    id: 0,
    group: 0,
    staff_name: "",
    start_time: "00:00",
    end_time: "00:00",
    date: "",
  };

  let temp = [];
  const tableBody = [];
  uniqueStaff.forEach((staff) => {
    temp.push(
      defaultItems.filter((currentStaff) => {
        if (currentStaff.staff_name === staff) return currentStaff;
      })
    );
  });
  //go through each day of the week
  // for (var i = 0; i < 7; i++) {
  //temp has 3 elements, and they are an array
  //temp[0]=>staffMembers  has 2 elements
  // so for staffMembers of temp element, the for loop is running 14 times, 7 times for each element
  let match = false;
  let startDate = new Date(weekInfo.weekStart);
  let totalHourPerDay = [];
  for (let i = 0; i <= weekInfo.duration; i++) {
    totalHourPerDay.push(0);
  }
  temp.forEach((staffMember, index) => {
    let totalHoursPerStaff = 0;
    tableBody.push(<tr />);
    tableBody.push(<th>{staffMember[0].staff_name}</th>);
    for (var i = 0; i < 7; i++) {
      match = false;
      var date = new Date();
      date.setDate(startDate.getDate() + i);
      staffMember.forEach((shifts) => {
        if (shifts.date == date.toDateString()) {
          match = true;
          let shiftLength =
            convertTime(shifts.end_time) -
            convertTime(shifts.start_time) -
            calculateBreak(shifts.start_time, shifts.end_time);
          totalHourPerDay[i] += shiftLength;
          totalHoursPerStaff +=
            convertTime(shifts.end_time) -
            convertTime(shifts.start_time) -
            calculateBreak(shifts.start_time, shifts.end_time);
          tableBody.push(
            <td>
              {shifts.start_time} {" To "}
              {shifts.end_time} <br />
              {calculateBreak(shifts.start_time, shifts.end_time) > 0
                ? calculateBreak(shifts.start_time, shifts.end_time) +
                  " (Hour) Break"
                : ""}
              <br />
              {shiftLength}
              {" Hour"}
            </td>
          );
        }
      });
      if (match == false) {
        staffMember.push(blankDate);
        tableBody.push(<td></td>);
      }
    }
    tableBody.push(<td>{totalHoursPerStaff}</td>);
    tableBody.push(<tr />);
  });
  tableBody.push(<tr />);
  tableBody.push(<th>Total Hours</th>);
  for (var i = 0; i < weekInfo.duration; i++) {
    tableBody.push(<td>{totalHourPerDay[i]}</td>);
  }
  let sum = totalHourPerDay.reduce(function (a, b) {
    return a + b;
  }, 0);
  tableBody.push(<th>{sum}</th>);
  tableBody.push(<tr />);
  // console.log(temp);
  return (
    <MDBContainer fluid size="12" sm="12" md="12" lg="12" xl="12">
      <MDBRow center>
        <MDBCol sm="12" md="12" lg="12" xl="12">
          <LeftSidebar />
        </MDBCol>
      </MDBRow>
      <MDBRow>
        {/* <MDBCol size="12" sm="4" md="4" lg="2" xl="2"></MDBCol> */}
        <MDBCol size="12" sm="12" md="12" lg="12" xl="12">
          <MDBRow>
            <MDBCol sm="12" md="12" lg="12">
              <div className={"staff-list-search"}>
                <div className={"space-evenly"}>
                  {/* <input
                    type="text"
                    name="search"
                    placeholder="Search by ..."
                    onChange={searchForStaffMember}
                    value={searchCriteriaValue}
                  /> */}
                  {/* {[SplitButton].map((DropdownType, idx) => (
                    <DropdownType
                      as={ButtonGroup}
                      key={idx}
                      id={`dropdown-button-drop-${idx}`}
                      size="sm"
                      staff_name={searchCriteria.label}
                    >
                      {searchByCriteraiList.map((criteria, index) => (
                        <Dropdown.Item
                          key={index}
                          onClick={(e) => {
                            setSearchCriteria(criteria);
                            setSearchCriteriaValue("");
                            setScreen(
                              allStaffList,
                              false,
                              numberOfStaffPerPage
                            );
                          }}
                          eventKey={index}
                        >
                          {criteria.label}
                        </Dropdown.Item>
                      ))}
                    </DropdownType>
                  ))} */}
                </div>
                {/* <div className="space-evenly">
                  <label>Staff per page</label>
                  <input
                    type="number"
                    name="numberOfItemsPerPage"
                    onChange={changeNumberOfItemsPerPage}
                    value={numberOfStaffPerPage}
                  />
                </div> */}
              </div>
            </MDBCol>
          </MDBRow>
          <MDBRow>
            <MDBCol>
              <MDBTable style={{ wordBreak: "break-all" }} bordered hover>
                <thead>
                  <tr>
                    <th>Name</th>
                    {tableHeader}
                    <th>Total</th>
                  </tr>
                </thead>
                {/* <tbody>{tableBody}</tbody> */}
                <tbody>
                  {Object.keys(shifts).map((staff) => (
                    <tr>
                      <th>{staff}</th>
                      {Object.values(shifts).map((shift_) =>
                        shift_.map((shift, index, arr) =>
                          staff === shift.username ? (
                            shift.start_time === "" ? (
                              <td></td>
                            ) : (
                              <td>
                                {shift.work_date}
                                <br />
                                {shift.start_time}
                                {" To "} {shift.end_time}
                                <br />
                                {shift.break_length}
                                {" Hour Break"}
                                <br />
                                {shift.shift_duration}
                                {" Hours"}
                              </td>
                            )
                          ) : (
                            ""
                          )
                        )
                      )}
                    </tr>
                  ))}
                  {/* {
    id: 13,
    group: 1,
    staff_name: "Nick",
    start_time: "7:00",
    end_time: "15:00",
    date: "Mon Aug 31 2020",
  } */}
                  {/* {shifts.map((staff) => (
                    <tr>
                      <td>{staff[0].username}</td>
                      {staff.map((shift) => (
                        <td>
                          {shift.id != 0
                            ? `${shift.timeslot_from} To ${shift.timeslot_to} (Hour)Break
                        
                          Hour`
                            : ""}
                        </td>
                      ))}
                      <td>27.5</td>
                    </tr>
                  ))} */}
                </tbody>
              </MDBTable>
            </MDBCol>
          </MDBRow>

          <Pagination className="pagination" {...paginationConfig} />
          <div className={"results"}>
            <label>
              {numberOfStaffPerPage > 0 ? `${current} of ${total}` : "0 of 0"}
            </label>
          </div>
        </MDBCol>
      </MDBRow>
      <MDBRow className="button-panel">
        <MDBCol sm="6" md="5" lg="4" xl="3">
          <Button href="#" btn-block>
            Publish
          </Button>
        </MDBCol>
        <MDBCol sm="6" md="5" lg="4" xl="3">
          <Button href="/admin" btn-block>
            Back to Admin
          </Button>
        </MDBCol>
      </MDBRow>
    </MDBContainer>
  );
}

export default WeeklyRoster;

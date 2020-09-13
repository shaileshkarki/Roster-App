// This module will be used to display weekly / monthly / daily wages in a paginated table
import React, { useEffect, useState } from "react";
import useWagesAPI from "../../hooks/useWagesAPI";
import useStaffApi from "../../hooks/useStaffApi";
import axios from "axios";
import { MDBContainer, MDBRow, MDBCol, MDBTable } from "mdbreact";
import {
  MDBDropdown,
  MDBDropdownToggle,
  MDBDropdownMenu,
  MDBDropdownItem,
  MDBBtnGroup,
} from "mdbreact";
import { Button } from "react-bootstrap";
import LeftSidebar from "../LeftSidebar";
import PaginationTable from "rbtpagination";
import useAPI from "../../hooks/useApi.js";

const searchByCriteraiList = [
  { label: "Roster Week", key: "roster_id" },
  { label: "Username", key: "username" },
  { label: "Title", key: "title" },
  { label: "Hourly Rate", key: "pay_rate" },
  { label: "Hours Worked (include break)", key: "hours_worked" },
  { label: "Total Pay (include break)", key: "total_shift_pay" },
];
const tableColumnsAndDataKeys = [
  { label: "Roster Week", key: "roster_id" },
  { label: "Username", key: "username" },
  { label: "Title", key: "title" },
  { label: "Hourly Rate", key: "pay_rate" },
  { label: "Hours Worked (include break)", key: "hours_worked" },
  { label: "Total Pay (include break)", key: "total_shift_pay" },
];

function Wages({}) {
  // const { data, request: getTotalRosterOneWages } = useWagesAPI();
  // const { data2, request: getSpecificDayWages } = useWagesAPI();

  // obtain the week numbers from the rosters query
  const { data: rosters, request: getRosters } = useAPI(
    "http://localhost:9000/roster/allRosters"
  );

  const { data: rosterOneWages, request: getTotalRosterOneWages } = useAPI(
    "http://localhost:9000/wages1"
  );

  // obtain the staff usernames for the drop down menu
  const { data: allUniqueUsernames, request: getAllUsernames } = useAPI(
    "http://localhost:9000/wages1/allusernames"
  );

  // the method below simply obtains a list of all the unique roles in our database.was going to use each role as a parameter for reports.
  const {
    data: uniqueRoleTitles,
    request: getTotalRosterOneRoleWages,
  } = useAPI("http://localhost:9000/wages1/uniqueroles");

  // the poitn of the below is obtain the dataset that catpures for each roster ID, the person, role and the wages paid out.
  const {
    data: allrosterpersontitlewages,
    request: getEachRosterWeekWagesByEachPersonAndRole,
  } = useAPI("http://localhost:9000/wages1/eachrosterswagesbyperson");

  useEffect(() => {
    // run a query to obtain all results from the query
    getTotalRosterOneWages();
    // getSpecificDayWages();
    getTotalRosterOneRoleWages();
    getRosters();
    getEachRosterWeekWagesByEachPersonAndRole();
    getAllUsernames();
  }, []);

  // obtain the week number so we can populate the drop down list
  let weekTitles = [];
  // map through teh rosters data object and collate all week titles to an array
  // rosters.map((roster) => {
  //     weekTitles.push(roster.title);
  // });

  // obtain the usernames for the drop down box for 3rd report
  // let uniqueNames = [];
  // allUniqueUsernames.map((usernames) => {
  //     uniqueNames.push(usernames);
  // });

  const handleTotalWagesRosterOne = async (e) => {
    e.preventDefault();
    const response = await axios.get(`http://localhost:9000/wages1`, {});
    console.log(response.status);
    // if (response.status === 200) {
    //     console.log(response.statusText);
    //     history.replace("/admin");
    // } else {
    //     alert(response.statusText);
    // }
    // getTotalRosterOneWages();
  };

  const handleTotalRoleWagesRosterOne = async (e) => {
    e.preventDefault();
    const response = await axios.get(
      `http://localhost:9000/wages1/uniqueroles`,
      {}
    );
    console.log(response.status);
    // if (response.status === 200) {
    //     console.log(response.statusText);
    //     history.replace("/admin");
    // } else {
    //     alert(response.statusText);
    // }
    // getTotalRosterOneWages();
  };

  const handlegetGachRosterWeekWagesByEachPersonAndRole = async (e) => {
    e.preventDefault();
    const response = await axios.get(
      `http://localhost:9000/wages1/eachrosterswagesbyperson`,
      {}
    );
    console.log(response.status);
    // if (response.status === 200) {
    //     console.log(response.statusText);
    //     history.replace("/admin");
    // } else {
    //     alert(response.statusText);
    // }
    // getTotalRosterOneWages();
  };

  return (
    <MDBContainer fluid size="12" sm="12" md="12" lg="12" xl="12">
      <MDBRow center>
        <MDBCol sm="12" md="12" lg="12" xl="12">
          <LeftSidebar />
        </MDBCol>
      </MDBRow>

      <MDBCol sm="12" md="12" lg="12" xl="12">
        <h1>Report Wages</h1>
        <MDBRow center>
          <MDBDropdown>
            <Button className="btn btn-primary mr-0">
              Weekly Wages by Roster
            </Button>
            <MDBDropdownToggle caret color="primary" />
            <MDBDropdownMenu basic>
              {rosters.map((roster) => (
                <MDBDropdownItem href={`/viewWeeklyWages/${roster.roster_id}`}>
                  {roster.title}
                </MDBDropdownItem>
              ))}
            </MDBDropdownMenu>
          </MDBDropdown>
          <MDBDropdown>
            <Button className="btn btn-primary mr-0">
              Weekly Wages by Job Title
            </Button>
            <MDBDropdownToggle caret color="primary" />
            <MDBDropdownMenu basic>
              {rosters.map((roster) => (
                <MDBDropdownItem
                  href={`/viewWeeklyJobWages/${roster.roster_id}`}
                >
                  {roster.title}
                </MDBDropdownItem>
              ))}
            </MDBDropdownMenu>
          </MDBDropdown>
          <MDBDropdown>
            <Button className="btn btn-primary mr-0">
              Weekly Wages by Staff Member
            </Button>
            <MDBDropdownToggle caret color="primary" />
            <MDBDropdownMenu basic>
              {allUniqueUsernames.map((usernames) => (
                <MDBDropdownItem
                  href={`/viewWeeklyStaffWages/${usernames.username}`}
                >
                  {usernames.username}
                </MDBDropdownItem>
              ))}
            </MDBDropdownMenu>
          </MDBDropdown>
        </MDBRow>
      </MDBCol>

      {/* <button
                onClick={handleTotalWagesRosterOne}
                className="btn btn-primary"
            >
                Load Wages Table
            </button>
            <PaginationTable
                dataSet={rosterOneWages}
                searchData={searchByCriteraiList}
                tableData={tableColumnsAndDataKeys}
                handleItemClick={false}
                itemsPerPage={20}
            /> */}

      {/* <button
                onClick={handleTotalRoleWagesRosterOne}
                className="btn btn-primary"
            >
                Load Role Table
            </button>
            <PaginationTable
                dataSet={uniqueRoleTitles}
                searchData={searchByCriteraiList}
                tableData={tableColumnsAndDataKeys}
                handleItemClick={false}
                itemsPerPage={20}
            /> */}
      {/* <button
                onClick={handlegetGachRosterWeekWagesByEachPersonAndRole}
                className="btn btn-primary"
            >
                Interactive Data Table Below
            </button>
            <PaginationTable
                dataSet={allrosterpersontitlewages}
                searchData={searchByCriteraiList}
                tableData={tableColumnsAndDataKeys}
                handleItemClick={false}
                itemsPerPage={40}
            /> */}
    </MDBContainer>
  );
}

export default Wages;

import React, { useEffect, useState } from "react";
import { useHistory } from "react-router-dom";

import Table from "react-bootstrap/Table";
import LeftSidebar from "./LeftSidebar";
import ReportsFooter from "./ReportsFooter";
import { MDBContainer, MDBRow, MDBCol } from "mdbreact";

import Pagination from "react-bootstrap-4-pagination";
import { SplitButton, Dropdown, ButtonGroup, Button } from "react-bootstrap";

import "./StaffListScreen.css";
import useStaffApi from "../hooks/useStaffApi";
import { paginate } from "../lib/pagination";
const searchByCriteraiList = [
  { label: "ID", key: "staff_id" },
  { label: "First Name", key: "firstname" },
  { label: "Last Name", key: "lastname" },
  { label: "Address", key: "address" },
  { label: "City", key: "city" },
  { label: "State", key: "state" },
  { label: "Post Code", key: "postcode" },
  { label: "Email", key: "email" },
];
function StaffListScreen(props) {
  const { request: getAllActiveStaffList } = useStaffApi();
  const [allStaffList, setAllStaffList] = useState([]); // All staff from database
  const [filteredStaffList, setFilteredStaffList] = useState([]); // All staff that meet seacrh criteria
  const [searchCriteria, setSearchCriteria] = useState(searchByCriteraiList[0]);
  const [searchCriteriaValue, setSearchCriteriaValue] = useState("");
  const [paginationData, setPaginationData] = useState([]); // Staff to  be displayed on screen depending on how many per page
  const [total, setTotal] = useState(0); // Sum of total staff listed on screen
  const [current, setCurrent] = useState(0); // Displaying value of 1st staff member on screen (ie 1 of 5)
  const [currentPage, setCurrentPage] = useState(0); // Current page of pagination
  const [numberOfStaffPerPage, setNumberOfStaffPerPage] = useState(10); // How many staff members to display per screen (pagination)
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
    loadStaffListScreen();
  }, []);

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
  return (

    <MDBContainer fluid>
      <MDBRow size="12" sm="6" lg="6">
        <MDBCol size="12" sm="12" lg="2">
          <LeftSidebar />
        </MDBCol>
        <MDBCol size="12" sm="12" lg="10">
          <div className={"staff-list-search"}>
            <div>
              <input
                type="text"
                name="search"
                placeholder="Search by ..."
                onChange={searchForStaffMember}
                value={searchCriteriaValue}
              />
              {[SplitButton].map((DropdownType, idx) => (
                <DropdownType
                  as={ButtonGroup}
                  key={idx}
                  id={`dropdown-button-drop-${idx}`}
                  size="sm"
                  title={searchCriteria.label}
                >
                  {searchByCriteraiList.map((criteria, index) => (
                    <Dropdown.Item
                      key={index}
                      onClick={(e) => {
                        setSearchCriteria(criteria);
                        setSearchCriteriaValue("");
                        setScreen(allStaffList, false, numberOfStaffPerPage);
                      }}
                      eventKey={index}
                    >
                      {criteria.label}
                    </Dropdown.Item>
                  ))}
                </DropdownType>
              ))}
            </div>
            <div>
              <p>Number of Staff per page</p>
              <input
                type="number"
                name="numberOfItemsPerPage"
                onChange={changeNumberOfItemsPerPage}
                value={numberOfStaffPerPage}
              />
            </div>
          </div>
          <Table bordered responsive="sm" hover>
            <thead>
              <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>Post Code</th>
                <th>Email</th>
              </tr>
            </thead>
            <tbody>
              {paginationData.map((staffMember, index) => (
                <tr
                  onDoubleClick={() =>
                    history.push("/StaffEditScreen", staffMember)
                  }
                  key={index}
                >
                  <td>{staffMember.staff_id}</td>
                  <td>{staffMember.firstname}</td>
                  <td>{staffMember.lastname}</td>
                  <td>{staffMember.address}</td>
                  <td>{staffMember.city}</td>
                  <td>{staffMember.state}</td>
                  <td>{staffMember.postcode}</td>
                  <td>{staffMember.email}</td>
                </tr>
              ))}
            </tbody>
          </Table>
          <Pagination className="pagination" {...paginationConfig} />
          {numberOfStaffPerPage > 0 ? `${current} of ${total}` : "0 of 0"}
          <div className="button-panel">
            <Button
              className="button-width"
              variant="outline-primary"
              href="/StaffNewScreen"
            >
              Create New Staff
        </Button>
            <Button
              className="button-width"
              variant="outline-primary"
              href="/admin"
            >
              Back
        </Button>
          </div>
        </MDBCol>
      </MDBRow>
    </MDBContainer>

  );
}

export default StaffListScreen;

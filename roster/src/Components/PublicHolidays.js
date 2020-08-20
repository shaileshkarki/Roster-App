import React, { useEffect, useState } from "react";
import { useHistory } from "react-router-dom";
import usePublicHolidaysAPI from "../hooks/usePublicHolidaysAPI";
import Table from "react-bootstrap/Table";
import LeftSidebar from "./LeftSidebar";
import ReportsFooter from "./ReportsFooter";
import { MDBContainer, MDBRow, MDBCol, MDBTable } from "mdbreact";

import Pagination from "react-bootstrap-4-pagination";
import { SplitButton, Dropdown, ButtonGroup, Button } from "react-bootstrap";

import "./StaffListScreen.css";

import { paginate } from "../lib/pagination";
const searchByCriteraiList = [
    { label: "ID", key: "phol_id" },
    { label: "State", key: "phol_state" },
    { label: "Date", key: "phol_date" }
];
function PublicHolidays(props) {
    //Added back code:
    const { request: getAllPublicHolidays } = usePublicHolidaysAPI();
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
        const { data } = await getAllPublicHolidays();
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

    // Added back code :
    let paginationConfig = {
        totalPages:
            numberOfStaffPerPage > 0
                ? Math.ceil(total / numberOfStaffPerPage)
                : 0,
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
                        filteredStaffList.length > 0
                            ? filteredStaffList
                            : allStaffList,
                        page - 1,
                        numberOfStaffPerPage
                    )
                );
                setCurrent(
                    page === 1 ? 1 : (page - 1) * numberOfStaffPerPage + 1
                );
            }
        },
    };
    return (
        <MDBContainer fluid size="12" sm="12" md="12" lg="12" xl="12">
            <MDBRow center>
                <MDBCol sm="12" md="12" lg="12" xl="12">
                    <LeftSidebar />
                </MDBCol>
            </MDBRow>
            <MDBRow >
                {/* <MDBCol size="12" sm="4" md="4" lg="2" xl="2"></MDBCol> */}
                <MDBCol size="12" sm="12" md="12" lg="12" xl="12">
                    <MDBRow>
                        <MDBCol sm="12" md="12" lg="12">
                            <div className={"staff-list-search"}>
                                <div className={"space-evenly"}>
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
                                            {searchByCriteraiList.map(
                                                (criteria, index) => (
                                                    <Dropdown.Item
                                                        key={index}
                                                        onClick={(e) => {
                                                            setSearchCriteria(
                                                                criteria
                                                            );
                                                            setSearchCriteriaValue(
                                                                ""
                                                            );
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
                                                )
                                            )}
                                        </DropdownType>
                                    ))}
                                </div>
                                <div className="space-evenly">
                                    <label>Public Holidays per page</label>
                                    <input
                                        type="number"
                                        name="numberOfItemsPerPage"
                                        onChange={changeNumberOfItemsPerPage}
                                        value={numberOfStaffPerPage}
                                    />
                                </div>
                            </div>
                        </MDBCol>
                    </MDBRow>
                    <MDBRow>
                        <MDBCol>
                            <MDBTable
                                style={{ wordBreak: "break-all" }}
                                bordered
                                hover
                            >
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>State</th>
                                        <th>Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {paginationData.map(
                                        (staffMember, index) => (
                                            <tr
                                                onClick={() =>
                                                    history.push(
                                                        "/StaffEditScreen",
                                                        staffMember
                                                    )
                                                }
                                                key={index}
                                            >
                                                <td>{staffMember.phol_id}</td>
                                                <td>{staffMember.phol_state}</td>
                                                <td>{staffMember.phol_date}</td>
                                            </tr>
                                        )
                                    )}
                                </tbody>
                            </MDBTable>
                        </MDBCol>
                    </MDBRow>

                    <Pagination className="pagination" {...paginationConfig} />
                    <div className={"results"}>
                        <label>
                            {numberOfStaffPerPage > 0
                                ? `${current} of ${total}`
                                : "0 of 0"}
                        </label>
                    </div>
                </MDBCol>
            </MDBRow>
            <MDBRow className="button-panel">
                <MDBCol sm="6" md="5" lg="4" xl="3">
                    <Button href="/StaffNewScreen" btn-block>Create New Staff</Button>
                </MDBCol>
                <MDBCol sm="6" md="5" lg="4" xl="3">
                    <Button href="/admin" btn-block>Back</Button>
                </MDBCol>
            </MDBRow>
        </MDBContainer>
    );
}

export default PublicHolidays;
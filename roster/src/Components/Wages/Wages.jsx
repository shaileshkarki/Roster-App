// This module will be used to display weekly / monthly / daily wages in a paginated table
import React, { useEffect, useState } from "react";
import useWagesAPI from "../../hooks/useWagesAPI";
import axios from "axios";
import { MDBContainer, MDBRow, MDBCol, MDBTable } from "mdbreact";
import LeftSidebar from "../LeftSidebar";
import PaginationTable from "rbtpagination";

const searchByCriteraiList = [
    { label: "ID", key: "staff_id" },
    { label: "Firstname", key: "firstname" },
    { label: "Title", key: "title" },
    { label: "Hourly Rate", key: "pay_rate" },
    { label: "Hours Worked (include break)", key: "hours_worked" },
    { label: "Total Pay (include break)", key: "total_shift_pay" },
];
const tableColumnsAndDataKeys = [
    { label: "ID", key: "staff_id" },
    { label: "Firstname", key: "firstname" },
    { label: "Title", key: "title" },
    { label: "Hourly Rate", key: "pay_rate" },
    { label: "Hours Worked (include break)", key: "hours_worked" },
    { label: "Total Pay (include break)", key: "total_shift_pay" },
];

function Wages(props) {
    const { data, request: getTotalRosterOneWages } = useWagesAPI();

    console.log("Am i getting any WAGES data????");
    console.log(data);

    useEffect(() => {
        // run a query to obtain all results from the query
        getTotalRosterOneWages();
    }, []);

    const handleTotalWagesRosterOne = async (e) => {
        e.preventDefault();
        const response = await axios.get(`http://localhost:9000/wages`, {});
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

            <button
                onClick={handleTotalWagesRosterOne}
                className="btn btn-primary"
            >
                Load Wages Table
            </button>
            <PaginationTable
                dataSet={data}
                searchData={searchByCriteraiList}
                tableData={tableColumnsAndDataKeys}
                handleItemClick={false}
                itemsPerPage={20}
            />
        </MDBContainer>
    );
}

export default Wages;

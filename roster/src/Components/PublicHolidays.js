import React, { useEffect, useState } from "react";
import { useHistory } from "react-router-dom";
import axios from "axios";

import usePublicHolidaysAPI from "../hooks/usePublicHolidaysAPI";
import PaginationTable from "rbtpagination";

const searchByCriteraiList = [
    { label: "ID", key: "phol_id" },
    { label: "State", key: "phol_state" },
    { label: "Date", key: "phol_date" },
    { label: "Name", key: "phol_name" },
];
const tableColumnsAndDataKeys = [
    { label: "ID", key: "phol_id" },
    { label: "State", key: "phol_state" },
    { label: "Date", key: "phol_date" },
    { label: "Name", key: "phol_name" },
];
function PublicHolidays(props) {
    const { data, request: getAllPublicHolidays } = usePublicHolidaysAPI();

    useEffect(() => {
        // run a query to obtain all public holidays from the database
        getAllPublicHolidays();
    }, []);

    // the below code resolves the EPOCH time display issue when we just want to see the YYYY-MM-DD details as opposed to the full string. We basically slice the colum and update each object data record.
    // start at the first record
    for (let i = 0; i < data.length; i++) {
        // obtain just the phol_date
        var tempDateAdjusted = data[i].phol_date;
        // assign the frist 10 chars of the timestamp
        data[i].phol_date = tempDateAdjusted.slice(0, 10);
        // print out the result to console
        // console.log(tempDateAdjusted, data[i].phol_date);
    }

    const handleLoadPublicHolidays = async (e) => {
        e.preventDefault();
        const response = await axios.put(
            `http://localhost:9000/publicholidays`,
            {}
        );
        console.log(response.status);
        // if (response.status === 200) {
        //     console.log(response.statusText);
        //     history.replace("/publicholidays");
        // } else {
        //     alert(response.statusText);
        // }
        getAllPublicHolidays();
    };

    return (
        <div>
            <button
                onClick={handleLoadPublicHolidays}
                className="btn btn-primary"
            >
                Load Public holidays
            </button>
            <PaginationTable
                dataSet={data}
                searchData={searchByCriteraiList}
                tableData={tableColumnsAndDataKeys}
                handleItemClick={false}
                itemsPerPage={20}
            />
        </div>
    );
}

export default PublicHolidays;

import React, { useEffect, useState } from "react";

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
    getAllPublicHolidays();
  }, []);

  return (
    <div>
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

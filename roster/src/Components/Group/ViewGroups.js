import React, { useEffect, useState } from "react";
import useApi from "../../hooks/useApi";
import { MDBRow, MDBCol, MDBTypography } from "mdbreact";
import PaginationTable from "rbtpagination";
import { Button } from "react-bootstrap";

// import "../../../node_modules/rbtpagination/dist/index.css";
import "../../../node_modules/rbtpagination//dist/index.css";
import LeftSidebar from "../LeftSidebar";

const searchByCriteraiList = [
  { label: "ID", key: "id" },
  { label: "Title", key: "title" },
  { label: "Minimum Shift Duration Hour", key: "group_duration" },
  { label: "Per Hour Rate", key: "pay_rate" },
];

const tableColumnsAndDataKeys = [
  { label: "ID", key: "id" },
  { label: "Title", key: "title" },
  { label: "Minimum Shift Duration Hour", key: "group_duration" },
  { label: "Per Hour Rate", key: "pay_rate" },
];
function ViewGroup(props) {
  const { data, request: getAllGroups } = useApi(`groups/`);
  // All group from database

  useEffect(() => {
    getAllGroups();
  }, []);

  return (
    <div>
      <MDBRow center>
        <MDBCol sm="12" md="12" lg="12" xl="12">
          <LeftSidebar />
        </MDBCol>
      </MDBRow>
      <MDBTypography tag="h2" variant="h2-responsive">
        Role Administration
      </MDBTypography>
      <PaginationTable
        dataSet={data}
        searchData={searchByCriteraiList}
        tableData={tableColumnsAndDataKeys}
        handleItemClick={true}
        itemClickRedirect="/GroupEditScreen"
        itemsPerPage={20}
      />

      <MDBRow className="button-panel">
        <MDBCol>
          <Button href="/createGroup" block>
            Create New Role
          </Button>
        </MDBCol>
        <MDBCol>
          <Button href="/admin" block>
            Back
          </Button>
        </MDBCol>
      </MDBRow>
    </div>
  );
}

export default ViewGroup;

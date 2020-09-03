// This module will be used to display weekly / monthly / daily wages in a paginated table
import React, { useEffect, useState } from "react";
import useApi from "../../hooks/useApi";
import { MDBContainer, MDBRow, MDBCol, MDBTable } from "mdbreact";

import Pagination from "react-bootstrap-4-pagination";
import { SplitButton, Dropdown, ButtonGroup, Button } from "react-bootstrap";
import { paginate } from "../../lib/pagination";

const Wages = () => {
    return (
        <div>
            <h1>PUT WAGES PAGINATION INFO HERE</h1>
        </div>
    );
};

export default Wages;

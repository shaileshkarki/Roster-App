import React, { useState, useEffect } from "react";
import { MDBContainer, MDBRow, MDBCol, MDBInput, MDBBtn } from "mdbreact";
import { Button } from "react-bootstrap";
import axios from "axios";
import { useHistory } from "react-router-dom";

function refreshPhol() {
    // use a hook to get all the pubic holiday
    const { request: getAllPublicHolidays } = usePublicHolidays();
}

export default refreshPhol;

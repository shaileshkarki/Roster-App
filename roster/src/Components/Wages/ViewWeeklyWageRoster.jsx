import React, { useEffect, useState } from "react";
import useApi from "../../hooks/useApi";
import LeftSidebar from "../LeftSidebar";
import { MDBContainer, MDBRow, MDBCol, MDBTable } from "mdbreact";
import ReactToPdf from "react-to-pdf";
import { SplitButton, Dropdown, ButtonGroup, Button } from "react-bootstrap";
// import "../StaffListScreen.css";

const ref = React.createRef();
const options = {
    orientation: "potrait",
    unit: "in",
    format: [6000, 1400],
};

function ViewWeeklyWageRoster(props) {
    const [totalHour, setTotalHour] = useState(0);
    const { data, request: getDesiredWeekWages } = useApi(
        `http://localhost:9000/wages/${props.match.params.rosterID}`
    );

    let first_record = {};
    // just assign the object record to be used to ascertain the heading for the table
    if (data.length > 0) {
        first_record = data[0];
    }

    useEffect(() => {
        getDesiredWeekWages();
        // setTotalHour();
    }, []);
    console.log("**************************");
    console.log(data);

    const tableHeader = [];
    let count = 0;

    // now obtain the table header headings to display on the report
    // use the first object's key's as the place to obtain headings
    console.log("*******************");
    for (const [key, value] of Object.entries(first_record)) {
        tableHeader.push(key);
    }

    // data.map((item) => {
    //     Object.keys(item).forEach((key, value) => {
    //         console.log(key, value);
    //     });
    // });

    data.map((item) => {
        Object.values(item).map((value, index) => {
            console.log(value);
        });
    });

    console.log({ tableHeader });

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
                        <MDBCol>
                            <div style={{ width: 100 + "vw" }}>
                                <ReactToPdf
                                    targetRef={ref}
                                    filename="roster.pdf"
                                    options={options}
                                    x={1}
                                    y={0.1}
                                    scale={1.5}
                                >
                                    {({ toPdf }) => (
                                        <Button onClick={toPdf}>
                                            Download pdf
                                        </Button>
                                    )}
                                </ReactToPdf>
                                <div style={{ width: 100 + "vw" }} ref={ref}>
                                    <MDBTable
                                        sm="12"
                                        style={{ wordBreak: "break-all" }}
                                        bordered
                                        hover
                                    >
                                        <thead>
                                            <tr>
                                                {tableHeader.map(
                                                    (tableHeading) => (
                                                        <th>{tableHeading}</th>
                                                    )
                                                )}
                                            </tr>
                                        </thead>
                                        {/* <tbody>{tableBody}</tbody> */}
                                        <tbody>
                                            {data.map((item) => (
                                                <tr>
                                                    {Object.values(item).map(
                                                        (value, index) => (
                                                            <td>{value}</td>
                                                        )
                                                    )}
                                                </tr>

                                                // <tr>
                                                //     <td>{item.staff_id}</td>
                                                //     <td>{item.username}</td>
                                                //     <td>{item.title}</td>
                                                //     <td>{item.pay_rate}</td>
                                                //     <td>{item.hours_worked}</td>
                                                //     <td>
                                                //         {item.total_shift_pay}
                                                //     </td>
                                                // </tr>
                                            ))}
                                        </tbody>
                                    </MDBTable>
                                </div>
                            </div>
                        </MDBCol>
                    </MDBRow>
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

export default ViewWeeklyWageRoster;

import React, { useEffect, useState } from "react";
import useApi from "../../hooks/useApi";
import LeftSidebar from "../LeftSidebar";
import { MDBContainer, MDBRow, MDBCol, MDBTable } from "mdbreact";
import ReactToPdf from "react-to-pdf";
import { SplitButton, Dropdown, ButtonGroup, Button } from "react-bootstrap";
import convertUnixTime from "../../lib/convertUnixTime";
import calculateBreak from "../../lib/calculateBreak";
import calculateCorrectPay from "../../lib/calculateCorrectPayWeeklyWagersRoster";
import calculateReportTotals from "../../lib/calculateReportTotals";
import calculateHeadings from "../../lib/calculateHeadingsForReports.js";
// import "../StaffListScreen.css";

const ref = React.createRef();
const options = {
  orientation: "portrait",
  unit: "in",
  format: [3000, 8000],
};

function ViewWeeklyWageRoster(props) {
  const [totalHour, setTotalHour] = useState(0);
  const { data, request: getDesiredWeekWages } = useApi(
    `http://localhost:9000/wages1/${props.match.params.rosterID}`
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
  // console.log("**************************");
  //console.log(data);

  // to get the length of the entire records returned in one objectyou can do the following
  // console.log(Object.keys(data).length);
  var objectLength = Object.keys(data).length;

  // loop through the data object and calcuate required fields and remove 2 redundant columns that have issues with invalid dates.
  for (var i = 0; i < objectLength; i++) {
    if (data[i].hasOwnProperty("timeslot_from")) {
      // add 2 new keys
      data[i].shift_start = convertUnixTime(Number(data[i].timeslot_from));
      data[i].shift_end = convertUnixTime(Number(data[i].timeslot_to));
      // convert the text timeslot data to numbers and then convert
      // var temp_ts_from = convertUnixTime(Number(data[i].timeslot_from));
      // var temp_ts_to = convertUnixTime(Number(data[i].timeslot_to));

      // data[i].timeslot_from = temp_ts_from;
      // data[i].timeslot_to = temp_ts_to;

      // calculate breaktime
      data[i].breakTime = calculateBreak(data[i].rostered_hours);
      // calculate actual work time
      data[i].actualWorkTime = data[i].rostered_hours - data[i].breakTime;
      data[i].pay = data[i].actualWorkTime * data[i].pay_rate;

      // remove the redundant timeslot_from, timeslot_to keys as they seem to have invalid dates being displayed.
      delete data[i].timeslot_from;
      delete data[i].timeslot_to;

      // delete the shift start end times.
      delete data[i].shift_start;
      delete data[i].shift_end;
    }
  }

  var newDataObject = calculateCorrectPay(data);

  // determine the table headings
  // var tableHeader = calculateHeadings(newDataObject);
  var tableHeader = [
    "Roster ID",
    "Username",
    "Job Title",
    "Hourly $ Rate",
    "Rostered Hours",
    "Break Time",
    "Actual Work Time",
    "Total Pay",
  ];

  // calculate TOTALS for the bottom of the report
  var reportTotals = calculateReportTotals(newDataObject);

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
                  {({ toPdf }) => <Button onClick={toPdf}>Download pdf</Button>}
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
                        {tableHeader.map((tableHeading) => (
                          <th>{tableHeading}</th>
                        ))}
                      </tr>
                    </thead>
                    {/* <tbody>{tableBody}</tbody> */}
                    <tbody>
                      {newDataObject.map((item) => (
                        <tr>
                          {Object.values(item).map((value, index) => (
                            <td>{value}</td>
                          ))}
                        </tr>
                      ))}
                      <tr>
                        Total Wages:
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>{reportTotals.totalRosteredHours}</td>
                        <td>{reportTotals.totalBreakTimeHours}</td>
                        <td>{reportTotals.totalActualWorkTimeHours}</td>
                        <td>${reportTotals.totalWages}</td>
                      </tr>
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

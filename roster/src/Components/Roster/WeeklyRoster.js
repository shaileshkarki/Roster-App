import React, { useEffect, useState } from "react";
import useApi from "../../hooks/useApi";
import LeftSidebar from "../LeftSidebar";
import { MDBContainer, MDBRow, MDBCol, MDBTable } from "mdbreact";
import ReactToPdf from "react-to-pdf";
import { SplitButton, Dropdown, ButtonGroup, Button } from "react-bootstrap";
import "../StaffListScreen.css";

const ref = React.createRef();
const options = {
  orientation: "potrait",
  unit: "in",
  format: [2500, 400],
};

function WeeklyRoster(props) {
  const [totalHour, setTotalHour] = useState(0);
  const { data, request: getShifts } = useApi(
    `http://localhost:9000/roster/${props.match.params.rosterID}`
  );
  let shifts = {};
  let Total = {};
  if (data.length > 0) {
    shifts = data[0];
    Total = data[1];
  }

  useEffect(() => {
    getShifts();
    // setTotalHour();
  }, []);

  const tableHeader = [];
  let count = 0;
  console.log("shifts", shifts);
  Object.values(shifts).map((shift_, index1) => {
    shift_.map((shift, index) => {
      if (index1 === 0 && index == 0) {
        let weekStart = new Date(shift.week_start);
        let weekEnd = new Date(shift.week_end);
        let rosterPeriod = (weekEnd - weekStart) / 1000 / 60 / 60 / 24;
        console.log({ weekStart }, { weekEnd }, { rosterPeriod });
        // console.log(rosterPeriod);
        for (let i = 0; i <= rosterPeriod; i++) {
          count++;
          let nextDay = new Date(weekStart);
          nextDay.setDate(nextDay.getDate() + i);
          tableHeader.push(nextDay.toDateString());
        }
      }
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
                  x={0.5}
                  y={0.5}
                  scale={0.5}
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
                        <th>Name</th>
                        {tableHeader.map((rosterDay) => (
                          <th>{rosterDay}</th>
                        ))}
                        {/* <th>Total</th> */}
                        <th>Total Hours</th>
                      </tr>
                    </thead>
                    {/* <tbody>{tableBody}</tbody> */}
                    <tbody>
                      {Object.keys(shifts).map((staff) => (
                        <tr>
                          <th>{staff}</th>
                          {tableHeader.map((rosterDay) => (
                            <td>
                              {Object.values(shifts).map((shift_) =>
                                shift_.map((shift, index, arr) =>
                                  staff === shift.username &&
                                  rosterDay == shift.work_date ? (
                                    shift.start_time === "" &&
                                    rosterDay == shift.work_date ? (
                                      ""
                                    ) : (
                                      <p
                                        onLoad={() =>
                                          (totalHour +=
                                            totalHour + shift.shift_duration)
                                        }
                                      >
                                        {shift.work_date}
                                        <br />
                                        {shift.start_time}
                                        {" To "} {shift.end_time}
                                        <br />
                                        {shift.break_length}
                                        {" Hour Break"}
                                        <br />
                                        {shift.shift_duration}
                                        {" Hours"}
                                      </p>
                                    )
                                  ) : (
                                    ""
                                  )
                                )
                              )}
                            </td>
                          ))}
                          <td>
                            {shifts[staff].reduce(
                              (totalHour, shift) =>
                                totalHour + shift.shift_duration,
                              0
                            )}
                          </td>
                        </tr>
                      ))}
                      <tr>
                        <td>Total</td>
                        {Object.keys(Total).map((rosterDate) => (
                          <td>{Total[rosterDate]}</td>
                        ))}
                        <td>
                          {Object.values(Total).reduce(
                            (total, individualDayTotal) =>
                              total + individualDayTotal,
                            0
                          )}
                        </td>
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
        {/* <MDBCol sm="6" md="5" lg="4" xl="3">
          <Button href="#" btn-block>
            Publish
          </Button>
        </MDBCol> */}
        <MDBCol sm="6" md="5" lg="4" xl="3">
          <Button href="/admin" btn-block>
            Back to Admin
          </Button>
        </MDBCol>
      </MDBRow>
    </MDBContainer>
  );
}

export default WeeklyRoster;

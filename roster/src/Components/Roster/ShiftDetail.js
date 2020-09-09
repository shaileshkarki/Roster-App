import React, { useState } from "react";
import "./ShiftDetail.css";

import {
  MDBCard,
  MDBCardBody,
  MDBCardTitle,
  MDBCardText,
  MDBCardHeader,
  MDBBtn,
  MDBContainer,
  MDBCardFooter,
  MDBDropdown,
  MDBDropdownToggle,
  MDBDropdownMenu,
  MDBDropdownItem,
  MDBBtnGroup,
} from "mdbreact";
import moment from "moment";

import { Button } from "react-bootstrap";

function ShiftDetail({
  startTime,
  endTime,
  name,
  handleAllocate,
  handleDeallocate,
  handleRemoveShift,
  handleClose,
  event,
  staff,
  id,
  shiftId,
}) {
  const duration = endTime - startTime;
  const [staffMember, setStaffMember] = useState(name);
  const [staffId, setStaffId] = useState(0);

  return (
    <div className="popup">
      <div className="popup-inner">
        <div className="popup-wrapper">
          <MDBContainer>
            <MDBCard>
              <MDBCardHeader color="blue lighten-1">
                {" "}
                Date {moment(startTime).format("dddd, MMMM Do YYYY")}
              </MDBCardHeader>
              <MDBCardBody>
                <MDBCardTitle>Shift Detail</MDBCardTitle>
                <div>Name {staffMember}</div>

                <div>{`Start Time: ${moment(startTime).format("h:mm a")}`}</div>
                <div>{`End Time: : ${moment(endTime).format("h:mm a")}`}</div>
                <div>{`Duration: ${(duration / 60 / 1000 / 60).toFixed(
                  2
                )} hrs`}</div>
                <div>
                  <MDBBtnGroup>
                    <MDBDropdown>
                      <Button className="btn btn-primary mr-0">
                        {staffMember}
                      </Button>
                      <MDBDropdownToggle caret color="primary" />
                      <MDBDropdownMenu color="primary">
                        {staff.map((member, index) => (
                          <MDBDropdownItem
                            key={index}
                            onClick={(e) => {
                              setStaffMember(member.name);
                              setStaffId(member.staff_member_id);
                              console.log("member = ", member.name);
                            }}
                          >
                            {member.name}
                          </MDBDropdownItem>
                        ))}
                      </MDBDropdownMenu>
                    </MDBDropdown>
                  </MDBBtnGroup>
                </div>
              </MDBCardBody>
              <MDBCardFooter className="button-panel">
                <Button
                  className="btn btn-green my-3 btn-block mr-2"
                  onClick={() =>
                    handleAllocate(staffMember, id, event, staffId)
                  }
                >
                  Allocate
                </Button>
                <Button
                  className="btn btn-danger my-3 btn-block mr-2"
                  onClick={() => handleRemoveShift(shiftId)}
                >
                  Remove Shift
                </Button>
                <Button
                  className="btn btn-danger my-3 btn-block mr-2"
                  onClick={() => handleDeallocate(staffMember, id, event)}
                >
                  Deallocate
                </Button>
                <Button
                  className="btn btn-primary my-3 btn-block mr-2"
                  onClick={handleClose}
                >
                  close
                </Button>
              </MDBCardFooter>
            </MDBCard>
          </MDBContainer>
        </div>
      </div>
    </div>
  );
}

export default ShiftDetail;

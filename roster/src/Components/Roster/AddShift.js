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

const createNext15MinuteTime = () => {
  let minutes15 = moment();
  minutes15 = Math.round(minutes15.minutes() / 15) * 15;
  let newStartTime = moment().minutes(minutes15);

  // console.log(newStartTime.toLocaleString());
  return newStartTime;
};
function AddShift({
  groups,
  handleClose,
  handleAddItem,
  weekNumber,
  items,
  handleSetAddShift,
}) {
  const [selectedGroup, setSelectedGroup] = useState(groups[0]);
  const [staffId, setStaffId] = useState(0);

  const addShift = () => {
    console.log("add shift");
    let newItems = [...items];
    let shift = {
      id: Math.ceil(Math.random() * 100000),
      group: selectedGroup.id,
      title: "Unallocated",
      weekNumber: weekNumber,
      start_time: moment.unix(createNext15MinuteTime().unix()),
      end_time: moment.unix(
        createNext15MinuteTime()
          .add(selectedGroup.group_duration, "hour")
          .unix()
      ),
      canMove: true,
      canResize: true,
      staff_id: 1,
      isallocated: true,
    };
    newItems.push(shift);

    handleAddItem([...newItems]);
    handleSetAddShift(null);
  };

  return (
    <div className="popup">
      <div className="popup-inner">
        <div className="popup-wrapper">
          <MDBContainer>
            <MDBCard>
              <MDBCardHeader color="blue lighten-1"> </MDBCardHeader>
              <MDBCardBody>
                <MDBCardTitle>Shift Detail</MDBCardTitle>
                <div>Group </div>

                <div>
                  <MDBBtnGroup>
                    <MDBDropdown>
                      <Button className="btn btn-primary mr-0">
                        {selectedGroup.title}
                      </Button>
                      <MDBDropdownToggle caret color="primary" />
                      <MDBDropdownMenu color="primary">
                        {groups.map((group, index) => (
                          <MDBDropdownItem
                            key={index}
                            onClick={(e) => {
                              setSelectedGroup(group);
                            }}
                          >
                            {group.title}
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
                  onClick={addShift}
                >
                  Add
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

export default AddShift;

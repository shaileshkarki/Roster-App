import React, { useState, useEffect } from "react";
import { MDBRow, MDBCol, MDBInput, MDBContainer } from "mdbreact";
import useApi from "../../hooks/useApi";
import { Button } from "react-bootstrap";

import axios from "axios";
import { useHistory } from "react-router-dom";
import {
  invalidEmailMsg,
  invalidMinMaxMsg,
  invalidNumber,
} from "../../lib/formValidation";

function AdminShiftScreen(props) {
  const { data: groups, request: getAllGroups } = useApi("/groups");
  const [selectedGroup, setSelectedGroup] = useState({});
  const [minDuration, setMinDuration] = useState("");
  const [title, setTitle] = useState("");
  let history = useHistory();

  const handleMinDurationChange = (e) => {
    setMinDuration(e.target.value);
  };
  const handleTitleChange = (e) => {
    setTitle(e.target.value);
  };
  useEffect(() => {
    getAllGroups();
  }, []);

  const handleSubmit = async (e) => {
    // debugger;
    e.preventDefault();
    if (!selectedGroup.staff_role) {
      return;
    }

    try {
      const response = await axios.post("/shift", {
        newShift: {
          minDuration,
          title,
          group: selectedGroup,
        },
      });
      if (response.status === 200) {
        console.log(response.statusText);
        history.replace("/admin");
      }
    } catch (error) {
      alert(`${error.response.statusText} \n${error}\n${error.response.data}`);
    }
  };

  return (
    <div>
      <MDBRow center>
        <MDBCol sm="12" md="6" lg="5" xl="5" className="grey-text">
          <form
            onSubmit={handleSubmit}
            className="staff-new-form border border-light p-5"
          >
            <p className="text-center h4  mb-4">{"Shift Screen"}</p>
            <div className="grey-text">
              <MDBInput
                label="Minimum Duration hrs"
                icon="clock"
                group
                type="text"
                validate
                error="wrong"
                success="right"
                required
                name="minDuration"
                minLength="1"
                maxLength="2"
                onChange={handleMinDurationChange}
                onInvalid={(e) => invalidNumber(e, 1, 2)}
                onInput={(e) => invalidNumber(e, 1, 2)}
                autoComplete="new-password"
                value={minDuration}
              />

              <MDBInput
                label="Title"
                icon="tag"
                group
                type="text"
                validate
                error="wrong"
                success="right"
                required
                name="title"
                minLength="2"
                maxLength="20"
                onChange={handleTitleChange}
                onInvalid={(e) => invalidMinMaxMsg(e, 2, 20)}
                onInput={(e) => invalidMinMaxMsg(e, 2, 20)}
                autoComplete="new-password"
                value={title}
              />

              <div className="btn-group staff-new-form">
                <button type="button" class="btn btn-primary">
                  {selectedGroup.staff_role
                    ? selectedGroup.staff_role
                    : "Groups"}
                </button>
                <button
                  type="button"
                  class="btn btn-primary dropdown-toggle px-3"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <span className="sr-only">Toggle Dropdown</span>
                </button>
                <div className="dropdown-menu staff-new-form">
                  {groups.map((group, index) => (
                    <a
                      onClick={(e) => {
                        setSelectedGroup(group);
                      }}
                      key={index}
                      className="dropdown-item text-center"
                      href="#"
                    >
                      {group.staff_role}
                    </a>
                  ))}
                </div>
              </div>
            </div>

            <Button
              type="submit"
              value="Submit"
              className="btn btn-primary my-3 btn-block mr-2"
            >
              {"Create New Shift"}
            </Button>

            <Button className="btn btn-primary my-3 btn-block" href="/admin">
              Back
            </Button>
          </form>
        </MDBCol>
      </MDBRow>
    </div>
  );
}

export default AdminShiftScreen;

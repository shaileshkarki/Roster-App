import React, { useState, useEffect } from "react";
import {
  MDBRow,
  MDBCol,
  MDBInput,
  MDBContainer,
  MDBNotification,
} from "mdbreact";
import useApi from "../../hooks/useApi";
import { Button, Toast } from "react-bootstrap";

import axios from "axios";
import { useHistory } from "react-router-dom";
import {
  invalidEmailMsg,
  invalidMinMaxMsg,
  invalidNumber,
} from "../../lib/formValidation";

function CreateGroup(props) {
  const [groupTitle, setGroupTitle] = useState({});
  const [groupDuration, setGroupDuration] = useState("");
  const [payRate, setPayRate] = useState("");
  let history = useHistory();

  const handleGroupTitleChange = (e) => {
    setGroupTitle(e.target.value);
  };
  const handleGroupDurationChange = (e) => {
    setGroupDuration(e.target.value);
  };
  const handlePayRateChange = (e) => {
    setPayRate(e.target.value);
  };
  useEffect(() => {
    // getAllGroups();
  }, []);

  const handleSubmit = async (e) => {
    // debugger;
    e.preventDefault();
    // if (!selectedGroup.staff_role) {
    //   return;
    // }

    try {
      const response = await axios.post("/groups/create", {
        newGroup: {
          groupTitle,
          groupDuration,
          payRate,
        },
      });
      if (response.data === true) {
        console.log(response.statusText);
        console.log(response.data);
        history.replace("/ViewGroups");
      } else {
        alert(
          "Error occured. Could not create new group. This group may already exist."
        );
      }
    } catch (error) {
      alert(`${error.response.statusText} \n${error}\n${error.response.data}`);
      // Toast.error("New group could not be added. Try again!");
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
            <p className="text-center h4  mb-4">{"Add New Group"}</p>
            <div className="grey-text">
              <MDBInput
                label="Group Title"
                icon="clock"
                group
                type="text"
                validate
                error="wrong"
                success="right"
                required
                name="groupTitle"
                minLength="3"
                maxLength="50"
                onChange={handleGroupTitleChange}
                onInvalid={(e) => invalidMinMaxMsg(e, 3, 50)}
                onInput={(e) => invalidMinMaxMsg(e, 3, 50)}
                autoComplete="new-password"
                // value={}
              />

              <MDBInput
                label="Minimum Duration Hour(s)"
                icon="clock"
                group
                type="text"
                validate
                error="wrong"
                success="right"
                required
                name="groupDuration"
                minLength="1"
                maxLength="5"
                onChange={handleGroupDurationChange}
                onInvalid={(e) => invalidNumber(e, 1, 5)}
                onInput={(e) => invalidNumber(e, 1, 5)}
                autoComplete="new-password"
                // value={}
              />
              <MDBInput
                label="Per Hour Pay Rate"
                icon="clock"
                group
                type="text"
                validate
                error="wrong"
                success="right"
                required
                name="payRate"
                minLength="1"
                maxLength="9"
                onChange={handlePayRateChange}
                onInvalid={(e) => invalidNumber(e, 1, 9)}
                onInput={(e) => invalidNumber(e, 1, 9)}
                autoComplete="new-password"
                // value={}
              />
            </div>

            <Button
              type="submit"
              value="Submit"
              className="btn btn-primary my-3 btn-block mr-2"
            >
              {"Create New Group"}
            </Button>

            <Button
              className="btn btn-primary my-3 btn-block"
              href="/ViewGroups"
            >
              Back
            </Button>
          </form>
        </MDBCol>
      </MDBRow>
      {/* <ToastContainer
        hideProgressBar={true}
        newestOnTop={true}
        autoClose={5000}
      /> */}
    </div>
  );
}

export default CreateGroup;

import React, { useState } from "react";
import { MDBRow, MDBCol, MDBInput } from "mdbreact";
import "./StaffNewScreen.css";
import { Button } from "react-bootstrap";
import axios from "axios";
import { useHistory } from "react-router-dom";

import {
  invalidEmailMsg,
  invalidMinMaxMsg,
  invalidNumber,
} from "../lib/formValidation";

function StaffForm({ data }) {
  const [staffId] = useState(data ? data.staff_id : "");
  const [firstname, setFirstName] = useState(data ? data.firstname : "");
  const [lastname, setLastName] = useState(data ? data.lastname : "");
  const [address, setAddress] = useState(data ? data.address : "");
  const [city, setCity] = useState(data ? data.city : "");
  const [state, setState] = useState(data ? data.state : "");
  const [postCode, setPostCode] = useState(data ? data.postcode : "");
  const [email, setEmail] = useState(data ? data.email : "");
  const [phone, setPhone] = useState(data ? data.phone_number : "");
  let history = useHistory();

  const handleFirstNameChange = (e) => {
    setFirstName(e.target.value);
  };
  const handleLastNameChange = (e) => {
    setLastName(e.target.value);
  };
  const handleAddressChange = (e) => {
    setAddress(e.target.value);
  };
  const handleCityChange = (e) => {
    setCity(e.target.value);
  };
  const handleStateChange = (e) => {
    setState(e.target.value);
  };
  const handlePostCodeChange = (e) => {
    setPostCode(e.target.value);
  };

  const handleEmailChange = (e) => {
    setEmail(e.target.value);
  };

  const handlePhoneChange = (e) => {
    setPhone(e.target.value);
  };

  const handleRemoveStaff = async (e) => {
    console.log("Delete");

    const response = await axios.put(
      `http://localhost:9000/staff/remove/${staffId}`,
      {
        removedStaffMember: {
          staffId,
          firstname,
          lastname,
          address,
          city,
          state,
          postCode,
          email,
          phone,
          isActive: false,
        },
      }
    );
    console.log(response.status);
    if (response.status === 200) {
      console.log(response.statusText);
      history.replace("/StaffListScreen");
    } else {
      alert(response.statusText);
    }
  };
  const handleUpdateSubmit = async (e) => {
    e.preventDefault();
    const response = await axios.put(`http://localhost:9000/staff/${staffId}`, {
      updatedStaffMember: {
        staffId,
        firstname,
        lastname,
        address,
        city,
        state,
        postCode,
        email,
        phone,
      },
    });
    console.log(response.status);
    if (response.status === 200) {
      console.log(response.statusText);
      history.replace("/StaffListScreen");
    } else {
      alert(response.statusText);
    }
  };
  const handleSubmit = async (e) => {
    e.target.classList.add("waves-effect");
    // debugger;
    e.preventDefault();

    try {
      const response = await axios.post("http://localhost:9000/staff", {
        newStaffMember: {
          firstname,
          lastname,
          address,
          city,
          state,
          postCode,
          email,
          phone,
          isActive: true,
        },
      });
      if (response.status === 200) {
        console.log(response.statusText);
        history.replace("/StaffListScreen");
      }
    } catch (error) {
      alert(`${error.response.statusText} \n${error}\n${error.response.data}`);
    }
  };
  return (
    <div>
      <MDBRow center>
        <MDBCol sm="12" md="9" lg="7" className="grey-text">
          <form
            className="staff-new-form border border-light"
            onSubmit={data ? handleUpdateSubmit : handleSubmit}
          >
            <p className="h5 text-center ">
              {data ? "Edit Staff" : "Add New Staff"}
            </p>
            <div className="grey-text">
              <MDBRow center>
                <MDBCol sm="12" md="9" lg="7">
                  <MDBInput
                    size="lg"
                    label="First Name"
                    icon="user-circle"
                    group
                    type="text"
                    validate
                    error="wrong"
                    success="right"
                    required
                    name="firstname"
                    minLength="2"
                    maxLength="20"
                    onChange={handleFirstNameChange}
                    onInvalid={(e) => invalidMinMaxMsg(e, 2, 20)}
                    onInput={(e) => invalidMinMaxMsg(e, 2, 20)}
                    autoComplete="new-password"
                    value={firstname}
                  />
                </MDBCol>
              </MDBRow>
              <MDBRow center>
                <MDBCol sm="12" md="9" lg="7">
                  <MDBInput
                    size="lg"
                    label="Last Name"
                    icon="user-circle"
                    group
                    type="text"
                    validate
                    error="wrong"
                    success="right"
                    required
                    name="lastname"
                    minLength="2"
                    maxLength="20"
                    onChange={handleLastNameChange}
                    onInvalid={(e) => invalidMinMaxMsg(e, 2, 20)}
                    onInput={(e) => invalidMinMaxMsg(e, 2, 20)}
                    autoComplete="new-password"
                    value={lastname}
                  />
                </MDBCol>
              </MDBRow>

              <MDBRow center>
                <MDBCol sm="12" md="9" lg="7">
                  <MDBInput
                    size="lg"
                    label="Address"
                    icon="address-card"
                    group
                    type="text"
                    validate
                    error="wrong"
                    success="right"
                    required
                    name="address"
                    minLength="3"
                    maxLength="50"
                    onChange={handleAddressChange}
                    onInvalid={(e) => invalidMinMaxMsg(e, 3, 50)}
                    onInput={(e) => invalidMinMaxMsg(e, 3, 50)}
                    autoComplete="new-password"
                    value={address}
                  />
                </MDBCol>
              </MDBRow>
              <MDBRow center>
                <MDBCol sm="12" md="9" lg="7">
                  <MDBInput
                    size="lg"
                    label="City"
                    icon="map"
                    group
                    type="text"
                    validate
                    error="wrong"
                    success="right"
                    required
                    name="city"
                    minLength="3"
                    maxLength="20"
                    onChange={handleCityChange}
                    onInvalid={(e) => invalidMinMaxMsg(e, 3, 20)}
                    onInput={(e) => invalidMinMaxMsg(e, 3, 20)}
                    autoComplete="new-password"
                    value={city}
                  />
                </MDBCol>
              </MDBRow>
              <MDBRow center>
                <MDBCol sm="12" md="9" lg="7">
                  <MDBInput
                    size="lg"
                    label="State"
                    icon="location-arrow"
                    group
                    type="text"
                    validate
                    error="wrong"
                    success="right"
                    required
                    name="state"
                    minLength="3"
                    maxLength="3"
                    onChange={handleStateChange}
                    onInvalid={(e) => invalidMinMaxMsg(e, 3, 20)}
                    onInput={(e) => invalidMinMaxMsg(e, 3, 20)}
                    autoComplete="new-password"
                    value={state}
                  />
                </MDBCol>
              </MDBRow>
              <MDBRow center>
                <MDBCol sm="12" md="9" lg="7">
                  <MDBInput
                    size="lg"
                    label="Post Code"
                    icon="map-signs"
                    group
                    type="text"
                    validate
                    error="wrong"
                    success="right"
                    required
                    name="postcode"
                    minLength="4"
                    maxLength="4"
                    onChange={handlePostCodeChange}
                    onInvalid={(e) => invalidNumber(e, 4, 4)}
                    onInput={(e) => invalidNumber(e, 4, 4)}
                    autoComplete="new-password"
                    value={postCode}
                  />
                </MDBCol>
              </MDBRow>

              <MDBRow center>
                <MDBCol sm="12" md="9" lg="7">
                  <MDBInput
                    size="lg"
                    label="Email"
                    icon="envelope"
                    group
                    type="email"
                    validate
                    error="wrong"
                    success="right"
                    required
                    name="email"
                    onChange={handleEmailChange}
                    minLength="3"
                    maxLength="50"
                    onInvalid={invalidEmailMsg}
                    onInput={invalidEmailMsg}
                    autoComplete="new-password"
                    pattern="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$"
                    value={email}
                  />
                </MDBCol>
              </MDBRow>
              <MDBRow center>
                <MDBCol sm="12" md="9" lg="7">
                  <MDBInput
                    size="lg"
                    label="Phone"
                    icon="phone"
                    group
                    type="text"
                    validate
                    error="wrong"
                    success="right"
                    required
                    minLength="10"
                    maxLength="10"
                    name="phone"
                    onChange={handlePhoneChange}
                    onInvalid={(e) => invalidNumber(e, 10, 10)}
                    onInput={(e) => invalidNumber(e, 10, 10)}
                    autoComplete="old-password"
                    value={phone}
                  />
                </MDBCol>
              </MDBRow>
              <MDBCol>
                <input style={{ display: "none" }} type="label" name="email2" />
              </MDBCol>
            </div>
            {
              <MDBRow center>
                <MDBCol sm="12" md="9" lg="7">
                  <Button
                    type="submit"
                    value="Submit"
                    className="btn btn-primary my-3 btn-block mr-2"
                  >
                    {data ? "Update Staff" : "Create New Staff"}
                  </Button>
                </MDBCol>
                {/* <button className="btn btn-primary my-4 btn-block" type="submit">
            {data ? "Update Staff" : "Create New Staff"}
            {/* </Button> */}
                {/* </button> */}
                {data ? (
                  <MDBCol sm="12" md="9" lg="7">
                    <Button
                      value="Submit"
                      className="btn btn-danger my-3 btn-block mr-2"
                      onClick={handleRemoveStaff}
                    >
                      Remove Staff Memebr
                    </Button>
                  </MDBCol>
                ) : (
                  ""
                )}
                <MDBCol sm="12" md="9" lg="7">
                  <Button
                    className="btn btn-primary my-3 btn-block"
                    href="/StaffListScreen"
                  >
                    Back
                  </Button>
                </MDBCol>
              </MDBRow>
            }
          </form>
        </MDBCol>
      </MDBRow>
    </div>
  );
}

export default StaffForm;

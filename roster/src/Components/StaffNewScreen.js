import React, { useState } from "react";
import { MDBContainer, MDBRow, MDBCol, MDBInput, MDBBtn } from "mdbreact";
import "./StaffNewScreen.css";
import { Button } from "react-bootstrap";
import axios from "axios";
import { useHistory } from "react-router-dom";

function StaffNewScreen(props) {
  const [firstname, setFirstName] = useState("");
  const [lastname, setLastName] = useState("");
  const [address, setAddress] = useState("");
  const [city, setCity] = useState("");
  const [state, setState] = useState("");
  const [postCode, setPostCode] = useState("");
  const [email, setEmail] = useState("");
  const [phone, setPhone] = useState("");
  let history = useHistory();

  const displayInvalid = (input, color) => {
    input.style.borderColor = color;
    input.previousElementSibling.style.color = color;
    input.nextElementSibling.style.color = color;
  };
  const displayValid = (input) => {
    input.style.borderColor = "";
    input.previousElementSibling.style.color = "";
    input.nextElementSibling.style.color = "";
  };
  const invalidEmailMsg = (e) => {
    console.log("e = ", e.target);
    if (e.target.value === "") {
      displayInvalid(e.target, "red");
      e.target.setCustomValidity("Required email address");
    } else if (e.target.validity.typeMismatch) {
      displayInvalid(e.target, "red");
      e.target.setCustomValidity("please enter a valid email address");
    } else {
      e.target.setCustomValidity("");
      displayValid(e.target);
    }
    return true;
  };

  const invalidMinMaxMsg = (e, min, max) => {
    // debugger;
    console.log(e);
    const fieldName = e.target.nextElementSibling.textContent;
    if (e.target.value === "") {
      e.target.setCustomValidity(`${fieldName} is required`);
      displayInvalid(e.target, "red");
    } else if (e.target.validity.tooShort) {
      e.target.setCustomValidity(
        `${fieldName} needs to be at least ${min} characters long.`
      );
      displayInvalid(e.target, "red");
    } else if (e.target.validity.tooLong) {
      e.target.setCustomValidity(
        `${fieldName} name needs to be between ${min} and ${max} characters long.`
      );
      displayInvalid(e.target, "red");
    } else {
      e.target.setCustomValidity("");
      displayValid(e.target);
    }
    return true;
  };

  const InvalidNumber = (e, min, max) => {
    const fieldName = e.target.nextElementSibling.textContent;
    if (e.target.value === "") {
      e.target.setCustomValidity(`${fieldName} is required`);
      displayInvalid(e.target, "red");
    } else if (isNaN(e.target.value)) {
      e.target.setCustomValidity(`${fieldName} needs to be Numeric.`);
      displayInvalid(e.target, "red");
    } else if (e.target.validity.tooShort) {
      e.target.setCustomValidity(
        `${fieldName} needs to be ${min} characters long.`
      );
      displayInvalid(e.target, "red");
    } else if (e.target.validity.tooLong) {
      e.target.setCustomValidity(
        `${fieldName} needs to be ${max} characters long.`
      );
      displayInvalid(e.target, "red");
    } else {
      e.target.setCustomValidity("");
      displayValid(e.target);
    }

    return true;
  };
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
  const handleSubmit = async (e) => {
    e.preventDefault();
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
  return (
    <div>
      <MDBContainer className="staff-new-form">
        <form onSubmit={handleSubmit}>
          <p className="h5 text-center mb-4">Add New Staff</p>
          <div className="grey-text">
            <MDBRow>
              <MDBCol md="6">
                <MDBInput
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
                />
              </MDBCol>
              <MDBCol md="6">
                <MDBInput
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
                />
              </MDBCol>
            </MDBRow>

            <MDBRow>
              <MDBCol>
                <MDBInput
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
                />
              </MDBCol>
            </MDBRow>
            <MDBRow>
              <MDBCol>
                <MDBInput
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
                />
              </MDBCol>
              <MDBCol>
                <MDBInput
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
                />
              </MDBCol>
              <MDBCol>
                <MDBInput
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
                  onInvalid={(e) => InvalidNumber(e, 4, 4)}
                  onInput={(e) => InvalidNumber(e, 4, 4)}
                />
              </MDBCol>
            </MDBRow>

            <MDBRow>
              <MDBCol>
                <MDBInput
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
                />
              </MDBCol>
              <MDBCol>
                <MDBInput
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
                  onInvalid={(e) => InvalidNumber(e, 10, 10)}
                  onInput={(e) => InvalidNumber(e, 10, 10)}
                />
              </MDBCol>
            </MDBRow>
          </div>
          <div className="button-panel">
            <Button
              type="submit"
              value="Submit"
              className="button-width"
              variant="outline-primary"
            >
              Create New Staff
            </Button>
            <Button
              className="button-width"
              variant="outline-primary"
              href="/StaffListScreen"
            >
              Back
            </Button>
          </div>
        </form>
      </MDBContainer>
    </div>
  );
}

export default StaffNewScreen;

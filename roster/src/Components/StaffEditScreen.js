import React, { useState, useEffect } from "react";
import { MDBContainer, MDBRow, MDBCol, MDBInput, MDBBtn } from "mdbreact";
import "./StaffNewScreen.css";
import { Button } from "react-bootstrap";
import axios from "axios";
import { useHistory } from "react-router-dom";

import {
    invalidEmailMsg,
    invalidMinMaxMsg,
    invalidNumber,
} from "../lib/formValidation";

function StaffEditScreen({ location }) {
    console.log(location.state.postcode);
    const [staffId, setStaffId] = useState(location.state.staff_id);
    const [firstname, setFirstName] = useState(location.state.firstname);
    const [lastname, setLastName] = useState(location.state.lastname);
    const [address, setAddress] = useState(location.state.address);
    const [city, setCity] = useState(location.state.city);
    const [state, setState] = useState(location.state.state);
    const [postCode, setPostCode] = useState(location.state.postcode);
    const [email, setEmail] = useState(location.state.email);
    const [phone, setPhone] = useState(location.state.phone);

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
    const handleSubmit = async (e) => {
        e.preventDefault();
        const response = await axios.put(
            `http://localhost:9000/staff/${staffId}`,
            {
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
    return (
        <div>
            {" "}
            <MDBContainer className="staff-new-form">
                <form onSubmit={handleSubmit}>
                    <p className="h5 text-center mb-4">Edit Staff</p>
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
                                    onInvalid={(e) =>
                                        invalidMinMaxMsg(e, 2, 20)
                                    }
                                    onInput={(e) => invalidMinMaxMsg(e, 2, 20)}
                                    value={firstname}
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
                                    onInvalid={(e) =>
                                        invalidMinMaxMsg(e, 2, 20)
                                    }
                                    onInput={(e) => invalidMinMaxMsg(e, 2, 20)}
                                    value={lastname}
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
                                    onInvalid={(e) =>
                                        invalidMinMaxMsg(e, 3, 50)
                                    }
                                    onInput={(e) => invalidMinMaxMsg(e, 3, 50)}
                                    value={address}
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
                                    onInvalid={(e) =>
                                        invalidMinMaxMsg(e, 3, 20)
                                    }
                                    onInput={(e) => invalidMinMaxMsg(e, 3, 20)}
                                    value={city}
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
                                    onInvalid={(e) =>
                                        invalidMinMaxMsg(e, 3, 20)
                                    }
                                    onInput={(e) => invalidMinMaxMsg(e, 3, 20)}
                                    value={state}
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
                                    onInvalid={(e) => invalidNumber(e, 4, 4)}
                                    onInput={(e) => invalidNumber(e, 4, 4)}
                                    value={postCode}
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
                                    value={email}
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
                                    onInvalid={(e) => invalidNumber(e, 10, 10)}
                                    onInput={(e) => invalidNumber(e, 10, 10)}
                                    value={phone}
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
                            Update Staff
                        </Button>
                        <Button
                            value="Submit"
                            className="button-width"
                            variant="outline-danger"
                            onClick={handleRemoveStaff}
                        >
                            Remove Staff Memebr
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

export default StaffEditScreen;

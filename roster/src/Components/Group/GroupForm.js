import React, { useState } from "react";
import { MDBRow, MDBCol, MDBInput } from "mdbreact";
import "../StaffNewScreen.css";
import { Button } from "react-bootstrap";
import axios from "axios";
import { useHistory } from "react-router-dom";

import {
    invalidEmailMsg,
    invalidMinMaxMsg,
    invalidNumber,
} from "../../lib/formValidation";

import HOST_URL from "../../lib/hostURL.js";

function GroupForm({ data }) {
    const [groupId] = useState(data ? data.id : "");
    const [title, setTitle] = useState(data ? data.title : "");
    const [groupDuration, setGroupDuration] = useState(
        data ? data.group_duration : ""
    );
    const [payRate, setPayRate] = useState(data ? data.pay_rate : "");
    let history = useHistory();

    const handleTitleChange = (e) => {
        setTitle(e.target.value);
    };
    const handleGroupDurationChange = (e) => {
        setGroupDuration(e.target.value);
    };
    const handlePayRateChange = (e) => {
        setPayRate(e.target.value);
    };

    const handleRemoveGroup = async (e) => {
        console.log("Delete");

        const response = await axios.delete(
            `${HOST_URL}groups/delete/${groupId}`,
            {}
        );
        console.log(response.status);
        if (response.status === 200) {
            console.log(response.statusText);
            history.replace("/ViewGroups");
        } else {
            alert(response.statusText);
        }
    };
    const handleUpdateSubmit = async (e) => {
        e.preventDefault();
        const response = await axios.put(`${HOST_URL}groups/edit/${groupId}`, {
            updatedGroup: {
                title,
                groupDuration,
                payRate,
            },
        });
        console.log(response.status);
        if (response.status === 200) {
            console.log(response.statusText);
            history.replace("/ViewGroups");
        } else {
            alert(response.statusText);
        }
    };
    const handleSubmit = async (e) => {
        e.target.classList.add("waves-effect");
        // debugger;
        e.preventDefault();

        try {
            const response = await axios.post(`${HOST_URL}group`, {
                newGroup: {
                    title,
                    groupDuration,
                    payRate,
                },
            });
            if (response.status === 200) {
                console.log(response.statusText);
                history.replace("/ViewGroups");
            }
        } catch (error) {
            alert(
                `${error.response.statusText} \n${error}\n${error.response.data}`
            );
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
                            {data ? "Edit Group" : "Add New Group"}
                        </p>
                        <div className="grey-text">
                            <MDBRow center>
                                <MDBCol sm="12" md="9" lg="7">
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
                                        onChange={handleTitleChange}
                                        onInvalid={(e) =>
                                            invalidMinMaxMsg(e, 3, 50)
                                        }
                                        onInput={(e) =>
                                            invalidMinMaxMsg(e, 3, 50)
                                        }
                                        autoComplete="new-password"
                                        value={title}
                                    />
                                </MDBCol>
                            </MDBRow>
                            <MDBRow center>
                                <MDBCol sm="12" md="9" lg="7">
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
                                        onInvalid={(e) =>
                                            invalidNumber(e, 1, 5)
                                        }
                                        onInput={(e) => invalidNumber(e, 1, 5)}
                                        autoComplete="new-password"
                                        value={groupDuration}
                                    />
                                </MDBCol>
                            </MDBRow>

                            <MDBRow center>
                                <MDBCol sm="12" md="9" lg="7">
                                    <MDBInput
                                        size="lg"
                                        label="Pay Rate"
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
                                        onChange={handlePayRateChange}
                                        onInvalid={(e) =>
                                            invalidMinMaxMsg(e, 3, 50)
                                        }
                                        onInput={(e) =>
                                            invalidMinMaxMsg(e, 3, 50)
                                        }
                                        autoComplete="new-password"
                                        value={payRate}
                                    />
                                </MDBCol>
                            </MDBRow>
                            <MDBCol>
                                <input
                                    style={{ display: "none" }}
                                    type="label"
                                    name="email2"
                                />
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
                                        {data
                                            ? "Update Group"
                                            : "Create New Group"}
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
                                            onClick={handleRemoveGroup}
                                        >
                                            Remove Group
                                        </Button>
                                    </MDBCol>
                                ) : (
                                    ""
                                )}
                                <MDBCol sm="12" md="9" lg="7">
                                    <Button
                                        className="btn btn-primary my-3 btn-block"
                                        href="/ViewGroups"
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

export default GroupForm;

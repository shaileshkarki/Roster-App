// import React from "react";
import React, { useState, useEffect } from "react";
import axios from "axios";
import { useHistory } from "react-router-dom";
import { MDBRow, MDBCol, MDBInput, MDBBtn } from "mdbreact";
import { Button } from "react-bootstrap";


function Login({ }) {
    const [email, setEmail] = useState(MDBInput.email);
    const [password, setPassword] = useState(MDBInput.password);
    let history = useHistory();
    const passwordMinLength = 6;
    const passwordMaxLength = 20;

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

    // validate email address
    const invalidEmailMsg = (e) => {
        // debugger;
        console.log("e = ", e.target);
        if (e.target.value === "") {
            displayInvalid(e.target, "red");
            e.target.setCustomValidity("Required email address");
        } else if (e.target.validity.patternMismatch) {
            displayInvalid(e.target, "red");
            e.target.setCustomValidity("please enter a valid email address");
        } else {
            e.target.setCustomValidity("");
            displayValid(e.target);
        }
        console.log(
            e.target.value.match(/^([\w.%+-]+)@([\w-]+\.)+([\w]{2,})$/i)
        );
        return true;
    };

    // check for min max lengths. Min 6 for password
    const invalidMinMaxMsg = (e, min, max) => {
        // debugger;
        console.log(e);
        const fieldName = e.target.nextElementSibling.textContent;
        if (e.target.value === '') {
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

    const handleEmailChange = (e) => {
        setEmail(e.target.value);
    };

    const handlePasswordChange = (e) => {
        setPassword(e.target.value);
    };
    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const response = await axios.post("http://localhost:9000/users/login", {
                user: {
                    email,
                    password
                },
            });
            if (response.status === 200) {
                console.log(response.statusText);
                history.replace("/admin");
            }
        } catch (error) {
            alert("response.statusText");
        }
    };
    return (
        <div>
            <MDBRow center>
                <MDBCol sm="12" md="6">
                    <form onSubmit={handleSubmit}>
                        <p className="h5 text-center mb-4">Sign in</p>
                        <div className="grey-text">
                            <MDBInput
                                label="Your email"
                                icon="envelope"
                                group
                                type="email"
                                validate
                                error="wrong"
                                success="right"
                                required
                                name="email"
                                onChange={handleEmailChange}
                                minLength="8"
                                maxLength="50"
                                onInvalid={invalidEmailMsg}
                                onInput={invalidEmailMsg}
                                value={email}
                                pattern="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$"
                            />
                            <MDBInput
                                label="Your password"
                                icon="lock"
                                required
                                group
                                type="password"
                                validate
                                name="password"
                                onChange={handlePasswordChange}
                                minLength={passwordMinLength}
                                maxLength={passwordMaxLength}
                                onInvalid={(e) => invalidMinMaxMsg(e, passwordMinLength, passwordMaxLength)}
                                onInput={(e) => invalidMinMaxMsg(e, passwordMinLength, passwordMaxLength)}
                                value={password}
                            />
                        </div>
                        <div className="text-center">
                            <Button
                                type="submit"
                                value="Submit"
                                className="button-width"
                                variant="outline-primary"
                            >
                                Login
            </Button>
                        </div>
                    </form>
                </MDBCol>
            </MDBRow>
        </div>
    );
}

export default Login;

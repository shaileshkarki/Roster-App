import React, { useState, useEffect } from "react";
import axios from "axios";
import FormErrors from "./FormErrors";
import { Redirect } from "react-router-dom";
import { MDBContainer, MDBRow, MDBCol, MDBInput, MDBBtn } from "mdbreact";
import { useHistory } from "react-router-dom";

import {
    displayInvalid,
    displayValid,
    invalidEmailMsg,
    invalidMinMaxMsg,
} from "../lib/formValidation";

function Register({}) {
    const [email, setEmail] = useState(MDBInput.email);
    const [password, setPassword] = useState(MDBInput.password);
    const [repassword, setRepassword] = useState(MDBInput.repassword);
    let history = useHistory();

    // checks to make sure that the passsword matches.
    // Not moved to formValidation.js becuase it requires a parameter password
    const invalidRepasswordMsg = (e) => {
        if (e.target.value !== password) {
            displayInvalid(e.target, "red");
            e.target.setCustomValidity(
                "Password and Re-password did not match"
            );
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

    const handleRepasswordChange = (e) => {
        setRepassword(e.target.value);
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const response = await axios.post(
                "http://localhost:9000/users/register",
                {
                    user: {
                        email,
                        password,
                    },
                }
            );
            if (response.status === 200) {
                console.log(response.statusText);
                history.replace("/login");
            }
        } catch (error) {
            alert("Error: could not register the user");
        }
    };
    return (
        <MDBRow center>
            <MDBCol sm="12" md="4">
                <form
                    class="text-center border border-light p-5"
                    onSubmit={handleSubmit}
                >
                    <p class="h4 mb-4">Register</p>
                    <MDBInput
                        label="Type your email"
                        icon="envelope"
                        type="email"
                        validate
                        error="wrong"
                        success="right"
                        required
                        id="defaultRegisterFormEmail"
                        class="form-control mb-4"
                        placeholder="E-mail"
                        name="email"
                        onChange={handleEmailChange}
                        minLength="8"
                        maxLength="50"
                        onInvalid={invalidEmailMsg}
                        onInput={invalidEmailMsg}
                        pattern="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$"
                        value={email}
                    />

                    <MDBInput
                        label="Type your password"
                        icon="lock"
                        type="password"
                        id="defaultRegisterFormPassword"
                        class="form-control"
                        placeholder="Password"
                        aria-describedby="defaultRegisterFormPasswordHelpBlock"
                        validate
                        name="password"
                        onChange={handlePasswordChange}
                        minLength="6"
                        maxLength="20"
                        onInvalid={invalidMinMaxMsg}
                        onInput={invalidMinMaxMsg}
                        value={password}
                    ></MDBInput>
                    {/* <small
                        id="defaultRegisterFormPasswordHelpBlock"
                        class="form-text text-muted mb-4"
                    >
                        At least 8 characters and 1 digit
                    </small> */}

                    <MDBInput
                        label="Type your re-password"
                        icon="lock"
                        type="password"
                        id="defaultRegisterFormRePassword"
                        class="form-control"
                        placeholder="Re-Password"
                        aria-describedby="defaultRegisterFormPasswordHelpBlock"
                        validate
                        name="repassword"
                        onChange={handleRepasswordChange}
                        // minLength="6"
                        // maxLength="20"
                        onInvalid={invalidRepasswordMsg}
                        onInput={invalidRepasswordMsg}
                        value={repassword}
                    ></MDBInput>

                    <button class="btn btn-info my-4 btn-block" type="submit">
                        Register
                    </button>

                    <p>or sign up with:</p>

                    <a href="#" class="mx-2" role="button">
                        <i class="fab fa-facebook-f light-blue-text"></i>
                    </a>
                    <a href="#" class="mx-2" role="button">
                        <i class="fab fa-twitter light-blue-text"></i>
                    </a>
                    <a href="#" class="mx-2" role="button">
                        <i class="fab fa-linkedin-in light-blue-text"></i>
                    </a>
                    <a href="#" class="mx-2" role="button">
                        <i class="fab fa-github light-blue-text"></i>
                    </a>

                    <hr />

                    <p>
                        By clicking
                        <em>Sign up</em> you agree to our
                        <a href="" target="_blank">
                            terms of service
                        </a>
                    </p>
                </form>
            </MDBCol>
        </MDBRow>
    );
}

export default Register;

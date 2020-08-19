import React, { useState, useEffect } from "react";
import axios from "axios";
import FormErrors from "./FormErrors";
import { Redirect } from "react-router-dom";
import { MDBContainer, MDBRow, MDBCol, MDBInput, MDBBtn } from "mdbreact";
import { useHistory } from "react-router-dom";



function Register({ }) {
    const [email, setEmail] = useState(MDBInput.email);
    const [password, setPassword] = useState(MDBInput.password);
    const [repassword, setRepassword] = useState(MDBInput.repassword);
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

    // const register = (e) => {
    //     // e.preventdefault();
    //     console.log("************************");
    //     console.log(this.props);

    //     try {
    //         axios
    //             .post(`http://localhost:9000/register`, {
    //                 email: this.state.email,
    //                 password_digest: this.state.password,
    //             })
    //             .then((response) => {
    //                 alert(response.data.result);
    //                 this.setState({
    //                     toHome: true,
    //                 });
    //                 // this.props.handleLogin(response.data)
    //             });
    //         // console.log('👉 Returned data:', response);
    //         // this.props.updateLogin(response);
    //     } catch (e) {
    //         console.log(`😱 Axios request failed: ${e}`);
    //     }
    // }

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
            // alert(e.target.value);
        }
        return true;
    };

    const invalidEmailMsg = (e) => {
        console.log("e = ", e.target);
        if (e.target.value === "") {
            displayInvalid(e.target, "red");
            e.target.setCustomValidity("Required email address");
        } else if (e.target.validity.typeMismatch) {
            displayInvalid(e.target, "red");
            e.target.setCustomValidity("please enter a valid email address");
        } else if (
            !e.target.value.match(/^([\w.%+-]+)@([\w-]+\.)+([\w]{2,})$/i)
        )
            displayInvalid(e.target, "red");
        else {
            e.target.setCustomValidity("");
            displayValid(e.target);
        }
        return true;
    };

    const invalidRepasswordMsg = (e) => {
        console.log(`e.target.value`, e.target.value);
        console.log(`password.value`, password);
        if (e.target.value !== password) {
            displayInvalid(e.target, "red");
            e.target.setCustomValidity("Password and Re-password did not match");
        }
        else {
            e.target.setCustomValidity("");
            displayValid(e.target);
        }
        return true;
    }
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
            const response = await axios.post("http://localhost:9000/users/register", {
                user: {
                    email,
                    password
                },
            });
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
                    <small
                        id="defaultRegisterFormPasswordHelpBlock"
                        class="form-text text-muted mb-4"
                    >
                        At least 8 characters and 1 digit
                            </small>

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

                    <button
                        class="btn btn-info my-4 btn-block"
                        type="submit"
                    >
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

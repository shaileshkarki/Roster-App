import React, { Component } from "react";
import axios from "axios";
import FormErrors from "./FormErrors";
import { Redirect } from "react-router-dom";
// import Form from 'bootstrap/Form';

import { MDBContainer, MDBRow, MDBCol } from "mdbreact";

class Register extends Component {
    state = {
        email: "",
        password: "",
        formErrors: { email: "", password: "", repassword: "" },
        emailValid: false,
        passwordValid: false,
        repasswordValid: false,
        formValid: false,
        toHome: false,
    };
    register(e) {
        // e.preventdefault();
        console.log("************************");
        console.log(this.props);

        try {
            axios
                .post(`http://localhost:9000/register`, {
                    email: this.state.email,
                    password_digest: this.state.password,
                })
                .then((response) => {
                    alert(response.data.result);
                    this.setState({
                        toHome: true,
                    });
                    // this.props.handleLogin(response.data)
                });
            // console.log('👉 Returned data:', response);
            // this.props.updateLogin(response);
        } catch (e) {
            console.log(`😱 Axios request failed: ${e}`);
        }
    }
    validateField(fieldName, value) {
        let fieldValidationErrors = this.state.formErrors;
        let emailValid = this.state.emailValid;
        let passwordValid = this.state.passwordValid;
        let repasswordValid = this.state.repasswordValid;

        switch (fieldName) {
            case "email":
                emailValid = value.match(/^([\w.%+-]+)@([\w-]+\.)+([\w]{2,})$/i)
                    ? true
                    : false;
                fieldValidationErrors.email = emailValid ? "" : " is invalid";
                break;
            case "password":
                passwordValid = value.length >= 6;

                fieldValidationErrors.password = passwordValid
                    ? ""
                    : " is too short";
                break;
            case "repassword":
                repasswordValid = value === this.state.password;
                fieldValidationErrors.repassword = repasswordValid
                    ? ""
                    : " did not match with password";
                break;
            default:
                break;
        }
        this.setState(
            {
                formErrors: fieldValidationErrors,
                emailValid: emailValid,
                passwordValid: passwordValid,
                repasswordValid: repasswordValid,
            },
            this.validateForm
        );
    }
    validateForm() {
        this.setState({
            formValid:
                this.state.emailValid &&
                this.state.passwordValid &&
                this.state.repasswordValid,
        });
    }

    reset() {
        this.setState({
            reset: true,
        });
    }
    handleUserInput(e) {
        const name = e.target.name;
        const value = e.target.value;
        this.setState({ [name]: value }, () => {
            this.validateField(name, value);
        });
    }

    displayInvalid = (input, color) => {
        input.style.borderColor = color;
        input.previousElementSibling.style.color = color;
        input.nextElementSibling.style.color = color;
    };

    invalidMinMaxMsg = (e, min, max) => {
        // debugger;
        console.log(e);
        const fieldName = e.target.nextElementSibling.textContent;
        if (e.target.value === "") {
            e.target.setCustomValidity(`${fieldName} is required`);
            this.displayInvalid(e.target, "red");
        } else if (e.target.validity.tooShort) {
            e.target.setCustomValidity(
                `${fieldName} needs to be at least ${min} characters long.`
            );
            this.displayInvalid(e.target, "red");
        } else if (e.target.validity.tooLong) {
            e.target.setCustomValidity(
                `${fieldName} name needs to be between ${min} and ${max} characters long.`
            );
            this.displayInvalid(e.target, "red");
        } else {
            e.target.setCustomValidity("");
            // this.displayValid(e.target);
            alert(e.target.value);
        }
        return true;
    };

    render() {
        if (this.state.toHome) {
            return <Redirect to="/" />;
        } else {
            return (
                <MDBRow center>
                    <MDBCol sm="12" md="4">
                        <form
                            class="text-center border border-light p-5"
                            action="#!"
                        >
                            <p class="h4 mb-4">Register</p>

                            {/* <div class="form-row mb-4">
                                <div class="col">
                                    <input
                                        type="text"
                                        id="defaultRegisterFormFirstName"
                                        class="form-control"
                                        placeholder="First name"
                                    />
                                </div>
                                <div class="col">
                                    <input
                                        type="text"
                                        id="defaultRegisterFormLastName"
                                        class="form-control"
                                        placeholder="Last name"
                                    />
                                </div>
                            </div> */}

                            <input
                                type="email"
                                id="defaultRegisterFormEmail"
                                class="form-control mb-4"
                                placeholder="E-mail"
                            />

                            <input
                                type="password"
                                id="defaultRegisterFormPassword"
                                class="form-control"
                                placeholder="Password"
                                aria-describedby="defaultRegisterFormPasswordHelpBlock"
                                minLength="6"
                                maxLength="20"
                                name="password"
                                onChange={(event) =>
                                    this.handleUserInput(event)
                                }
                                onInvalid={(e) =>
                                    this.invalidMinMaxMsg(e, 2, 20)
                                }
                                onInput={(e) => this.invalidMinMaxMsg(e, 2, 20)}
                            ></input>
                            <small
                                id="defaultRegisterFormPasswordHelpBlock"
                                class="form-text text-muted mb-4"
                            >
                                At least 8 characters and 1 digit
                            </small>

                            {/* <input
                                type="text"
                                id="defaultRegisterPhonePassword"
                                class="form-control"
                                placeholder="Phone number"
                                aria-describedby="defaultRegisterFormPhoneHelpBlock"
                            />
                            <small
                                id="defaultRegisterFormPhoneHelpBlock"
                                class="form-text text-muted mb-4"
                            >
                                Optional - for two step authentication
                            </small> */}

                            {/* <div class="custom-control custom-checkbox">
                                <input
                                    type="checkbox"
                                    class="custom-control-input"
                                    id="defaultRegisterFormNewsletter"
                                ></input>
                                <label
                                    class="custom-control-label"
                                    for="defaultRegisterFormNewsletter"
                                >
                                    Subscribe to our newsletter
                                </label>
                            </div> */}

                            <button
                                class="btn btn-info my-4 btn-block"
                                type="submit"
                            >
                                Sign in
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
    }
}

export default Register;

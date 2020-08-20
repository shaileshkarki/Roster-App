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
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [repassword, setRepassword] = useState("");
  let history = useHistory();
  const passwordMinLength = 6;
  const passwordMaxLength = 20;

  // checks to make sure that the passsword matches.
  // Not moved to formValidation.js becuase it requires a parameter password
  const invalidRepasswordMsg = (e, min, max) => {
    // invalidMinMaxMsg(e, min, max);
    // debugger;
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
    } else if (e.target.value !== password) {
      displayInvalid(e.target, "red");
      e.target.setCustomValidity("Password and Re-password did not match");
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
      alert("Email already exists");
    }
  };
  return (
    <MDBRow center>
      <MDBCol sm="12" md="6" lg="5" xl="5" className="grey-text">
        <form
          className="staff-new-form border border-light p-5"
          onSubmit={handleSubmit}
        >
          <p className="text-center h4 mb-4">Register</p>
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
            className="form-control"
            placeholder="Password"
            aria-describedby="defaultRegisterFormPasswordHelpBlock"
            validate
            required
            name="password"
            onChange={handlePasswordChange}
            minLength={passwordMinLength}
            maxLength={passwordMaxLength}
            onInvalid={(e) =>
              invalidMinMaxMsg(e, passwordMinLength, passwordMaxLength)
            }
            onInput={(e) =>
              invalidMinMaxMsg(e, passwordMinLength, passwordMaxLength)
            }
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
            required
            name="repassword"
            onChange={handleRepasswordChange}
            minLength={passwordMinLength}
            maxLength={passwordMaxLength}
            onInvalid={(e) =>
              invalidRepasswordMsg(e, passwordMinLength, passwordMaxLength)
            }
            onInput={(e) =>
              invalidRepasswordMsg(e, passwordMinLength, passwordMaxLength)
            }
            value={repassword}
          ></MDBInput>
          <div className="text-center">
            <button className="btn btn-info my-4 btn-block" type="submit">
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
          </div>
        </form>
      </MDBCol>
    </MDBRow>
  );
}

export default Register;

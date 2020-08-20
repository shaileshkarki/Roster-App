// import React from "react";
import React, { useState, useEffect } from "react";
import axios from "axios";
import { useHistory } from "react-router-dom";
import { MDBRow, MDBCol, MDBInput, MDBBtn } from "mdbreact";
import { Button } from "react-bootstrap";

import {
  displayInvalid,
  displayValid,
  invalidEmailMsg,
  invalidMinMaxMsg,
} from "../lib/formValidation";

function Login({}) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  let history = useHistory();
  const passwordMinLength = 6;
  const passwordMaxLength = 20;

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
          password,
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
        <MDBCol sm="12" md="6" lg="5" xl="5" className="grey-text">
          <form
            onSubmit={handleSubmit}
            className="staff-new-form border border-light p-5"
          >
            <p className="text-center h4  mb-4">Sign in</p>
            <div>
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
                onInvalid={(e) =>
                  invalidMinMaxMsg(e, passwordMinLength, passwordMaxLength)
                }
                onInput={(e) =>
                  invalidMinMaxMsg(e, passwordMinLength, passwordMaxLength)
                }
                value={password}
              />
            </div>
            <div className="text-center">
              <Button
                type="submit"
                value="Submit"
                className="btn btn-info my-4 btn-block"
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

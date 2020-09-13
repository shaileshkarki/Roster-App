// import React from "react";
import React, { useState, useEffect } from "react";
import axios from "axios";
import { Link, Redirect } from "react-router-dom";
import { MDBRow, MDBCol, MDBInput, MDBBtn } from "mdbreact";
import { Button } from "react-bootstrap";
import { useAuth } from "../context/auth";
import {
  displayInvalid,
  displayValid,
  invalidEmailMsg,
  invalidMinMaxMsg,
} from "../lib/formValidation";

function Login(props) {
  const [isLoggedIn, setLoggedIn] = useState(false);
  const [isError, setIsError] = useState(false);
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const { setAuthTokens } = useAuth();

  let referer;
  if (props.location.state !== null) {
    referer = props.location.state.referer;
  } else {
    referer = "/";
  }

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
      const result = await axios.post("/users/login", {
        user: {
          email,
          password,
        },
      });
      // console.log(result.data[0].email);
      if (result.data[0].email === email) {
        setAuthTokens(result.data[0]);
        setLoggedIn(true);
      } else {
        setIsError(true);
        alert(result.data);
      }
    } catch (e) {
      setIsError(true);
    }
  };
  // console.log("AuthTokens", authTokens);
  if (isLoggedIn) {
    return <Redirect to={referer} />;
  }
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
          {/* {isError && <p>The username or password provided were incorrect!</p>} */}
        </MDBCol>
      </MDBRow>
    </div>
  );
}

export default Login;

// import React from "react";
import React, { useState, useEffect } from "react";

import { MDBContainer, MDBRow, MDBCol, MDBInput, MDBBtn } from "mdbreact";

// class Login extends React.Component {
//     render() {
//         return (
//             <MDBRow center>
//                 <MDBCol sm="12" md="6">
//                     <form>
//                         <p className="h5 text-center mb-4">Sign in</p>
//                         <div className="grey-text">
//                             <MDBInput
//                                 label="Type your email"
//                                 icon="envelope"
//                                 group
//                                 type="email"
//                                 validate
//                                 error="wrong"
//                                 success="right"
//                             />
//                             <MDBInput
//                                 label="Type your password"
//                                 icon="lock"
//                                 group
//                                 type="password"
//                                 validate
//                             />
//                         </div>
//                         <div className="text-center">
//                             <MDBBtn>Login</MDBBtn>
//                         </div>
//                     </form>
//                 </MDBCol>
//             </MDBRow>
//         );
//     }
// }

function Login({}) {
    const [email, setEmail] = useState(MDBInput.email);
    const [password, setPassword] = useState(MDBInput.password);

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

    const handleEmailChange = (e) => {
        setEmail(e.target.value);
    };

    const handlePasswordChange = (e) => {
        setPassword(e.target.value);
    };

    return (
        <div>
            <MDBRow center>
                <MDBCol sm="12" md="6">
                    <form>
                        <p className="h5 text-center mb-4">Sign in</p>
                        <div className="grey-text">
                            <MDBInput
                                label="Type your email"
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
                            />
                            <MDBInput
                                label="Type your password"
                                icon="lock"
                                group
                                type="password"
                                validate
                                name="password"
                                onChange={handlePasswordChange}
                                minLength="6"
                                maxLength="20"
                                onInvalid={invalidMinMaxMsg}
                                onInput={invalidMinMaxMsg}
                                value={password}
                            />
                        </div>
                        <div className="text-center">
                            <MDBBtn>Login</MDBBtn>
                        </div>
                    </form>
                </MDBCol>
            </MDBRow>
        </div>
    );
}

export default Login;

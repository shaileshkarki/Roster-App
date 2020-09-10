import React, { useState, useContext } from "react";
import {
  MDBNavbar,
  MDBNavbarBrand,
  MDBNavbarNav,
  MDBNavItem,
  MDBNavLink,
  MDBNavbarToggler,
  MDBCollapse,
  MDBBtn,
} from "mdbreact";
import { useAuth } from "../context/auth";
import { Redirect } from "react-router-dom";

function NavbarPage(props) {
  const [isOpen, setIsOpen] = useState(false);
  const { authTokens, setAuthTokens } = useAuth();
  console.log("nvbar authContext", authTokens);
  function logOut() {
    // console.log("Logout", authTokens);
    // console.log("tokens", localStorage.getItem("tokens"));
    // localStorage.removeItem("tokens");
    // console.log("getItem", localStorage.getItem("tokens"));
    setAuthTokens(null);
    // console.log("Logout", authTokens);
    return <Redirect to="/" />;
  }
  return (
    <MDBNavbar color="indigo" dark expand="md">
      <MDBNavbarBrand>
        <strong className="white-text">Roster</strong>
      </MDBNavbarBrand>
      <MDBNavbarToggler
        onClick={() => {
          setIsOpen(!isOpen);
        }}
      />
      <MDBCollapse id="navbarCollapse3" isOpen={isOpen} navbar>
        <MDBNavbarNav left>
          <MDBNavItem active>
            <MDBNavLink exact to="/">
              Home
            </MDBNavLink>
          </MDBNavItem>
          <MDBNavItem>
            <MDBNavLink to="/about">About</MDBNavLink>
          </MDBNavItem>
          <MDBNavItem>
            <MDBNavLink to="/contact">Contact Us</MDBNavLink>
          </MDBNavItem>
          <MDBNavItem>
            <MDBNavLink to="/admin">Admin</MDBNavLink>
          </MDBNavItem>
        </MDBNavbarNav>
        <MDBNavbarNav right>
          {authTokens ? (
            <MDBNavItem>
              <MDBNavLink to="#">{authTokens.email}</MDBNavLink>{" "}
              <MDBBtn onClick={logOut}>Log out</MDBBtn>
            </MDBNavItem>
          ) : (
            <MDBNavItem>
              <MDBNavLink to="/register">Register</MDBNavLink>{" "}
              <MDBNavLink to="/login">Login</MDBNavLink>
            </MDBNavItem>
          )}
        </MDBNavbarNav>
      </MDBCollapse>
    </MDBNavbar>
  );
}

export default NavbarPage;

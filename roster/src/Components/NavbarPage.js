import React, { Component } from "react";
import {
    MDBNavbar, MDBNavbarBrand, MDBNavbarNav, MDBNavItem, MDBNavLink, MDBNavbarToggler, MDBCollapse,
} from "mdbreact";
import { BrowserRouter as Router } from 'react-router-dom';

class NavbarPage extends Component {
    state = {
        isOpen: false
    };

    toggleCollapse = () => {
        this.setState({ isOpen: !this.state.isOpen });
    }

    render() {
        return (

            <MDBNavbar color="indigo" dark expand="md">
                <MDBNavbarBrand>
                    <strong className="white-text">Navbar</strong>
                </MDBNavbarBrand>
                <MDBNavbarToggler onClick={this.toggleCollapse} />
                <MDBCollapse id="navbarCollapse3" isOpen={this.state.isOpen} navbar>
                    <MDBNavbarNav left>
                        <MDBNavItem active>
                            <MDBNavLink exact to="/">Home</MDBNavLink>
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
                        <MDBNavItem>
                            <MDBNavLink to="/register">Register</MDBNavLink>
                        </MDBNavItem>
                        <MDBNavItem>
                            <MDBNavLink to="/login">Login</MDBNavLink>
                        </MDBNavItem>
                    </MDBNavbarNav>
                </MDBCollapse>
            </MDBNavbar>

        );
    }
}

export default NavbarPage;
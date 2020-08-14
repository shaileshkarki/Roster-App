import React, { Component } from 'react';
import Navbar from 'react-bootstrap/Navbar';
import Nav from 'react-bootstrap/Nav';
import Col from 'react-bootstrap/Col';
import NavLink from 'react-router-dom/NavLink';

export default class CustomNavbar extends Component {
    render() {
        return (
            <Navbar collapseOnSelect expand="md" bg="light" variant="light">
                <Col>
                    <Navbar.Brand>
                        <NavLink to="/">Roster App Logo</NavLink>
                    </Navbar.Brand>
                </Col>

                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse id="basic-navbar-nav">

                    <Nav>

                        <NavLink exact to="/">Home</NavLink>

                        <NavLink to="/about">About</NavLink>

                        <NavLink to="/contact">Contact Us</NavLink>

                        <NavLink to="/login">Login</NavLink>

                        <NavLink to="/admin">Admin</NavLink>

                    </Nav>
                </Navbar.Collapse>
            </Navbar >
        )
    }
}



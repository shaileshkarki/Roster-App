import React, { Component } from 'react';
import Navbar from 'react-bootstrap/Navbar';
import Nav from 'react-bootstrap/Nav';
import Col from 'react-bootstrap/Col';
import NavLink from 'react-router-dom/NavLink';

export default class CustomNavbar extends Component {
    render() {
        return (
            // <Navbar collapseOnSelect expand="md" bg="light" variant="light">
            //     <Col>
            //         <Navbar.Brand>
            //             <NavLink to="/">Roster App Logo</NavLink>
            //         </Navbar.Brand>
            //     </Col>

            //     <Navbar.Toggle aria-controls="basic-navbar-nav" />
            //     <Navbar.Collapse id="basic-navbar-nav">

            //         <Nav>

            //             <NavLink exact to="/">Home</NavLink>

            //             <NavLink to="/about">About</NavLink>

            //             <NavLink to="/contact">Contact Us</NavLink>

            //             <NavLink to="/login">Login</NavLink>

            //             <NavLink to="/admin">Admin</NavLink>

            //         </Nav>
            //     </Navbar.Collapse>
            // </Navbar >

            //new

            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button
                            type="button"
                            class="navbar-toggle"
                            data-toggle="collapse"
                            data-target="#myNavbar"
                        >
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">
                            Logo
                            </a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li class="active">
                                <NavLink exact to="/">Home</NavLink>

                            </li>
                            <li>
                                <NavLink to="/about">About</NavLink>
                            </li>

                            <li>
                                <NavLink to="/contact">Contact Us</NavLink>
                            </li>
                            <li>
                                <NavLink to="/admin">Admin</NavLink>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <NavLink to="/login">
                                    <span class="glyphicon glyphicon-log-in"></span>
                                        Login
                                    </NavLink>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        )
    }
}



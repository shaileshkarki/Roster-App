import React, { Component } from "react";
import Navbar from "react-bootstrap/Navbar";
import Nav from "react-bootstrap/Nav";
import Col from "react-bootstrap/Col";
import NavLink from "react-router-dom/NavLink";

export default class CustomNavbar extends Component {
    render() {
        return (
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
                                <NavLink exact to="/">
                                    Home
                                </NavLink>
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
                                <NavLink to="/register">
                                    <span class="glyphicon glyphicon-user"></span>
                                    Register
                                </NavLink>
                            </li>
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
        );
    }
}

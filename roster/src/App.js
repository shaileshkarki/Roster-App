import React, { Component } from "react";
import "./App.css";
import { Route, NavLink, BrowserRouter as Router } from "react-router-dom";
import { Row, Nav, Col } from "react-bootstrap";

import ContactUs from "./Components/ContactUs";
import Login from "./Components/Login";
import About from "./Components/About";
import Home from "./Components/Home";
import StaffListScreen from "./Components/StaffListScreen";
import AdminPanel from "./Components/AdminPanel";
import Footer from "./Components/Footer";
import CustomNavbar from "./Components/CustomNavbar";
import LeftSidebar from "./Components/LeftSidebar";
import MiddleContainer from "./Components/MiddleContainer";
import ReportsFooter from "./Components/ReportsFooter";

class App extends Component {
    render() {
        return (
            <Router>
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
                                    <a href="#">Home</a>
                                </li>
                                <li>
                                    <a href="#">About</a>
                                </li>
                                <li>
                                    <a href="#">Projects</a>
                                </li>
                                <li>
                                    <a href="#">Contact</a>
                                </li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="#">
                                        <span class="glyphicon glyphicon-log-in"></span>
                                        Login
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="container-fluid text-center">
                    <div class="row content">
                        <LeftSidebar />

                        <MiddleContainer />
                    </div>
                </div>

                <ReportsFooter />

                <Footer />

                <Row>
                    <Col>
                        <header>
                            <h1>Roster Application</h1>
                        </header>
                    </Col>
                </Row>

                {/* <Row>
                    <Col>
                        <CustomNavbar />
                    </Col>
                </Row> */}
                <Row>
                    <Col>
                        <Route path="/about" component={About} />
                        <Route path="/contact" component={ContactUs} />
                        <Route path="/admin" component={AdminPanel} />
                        <Route path="/login" component={Login} />
                        <Route exact path="/" component={Home} />
                        <Route
                            path="/StaffListScreen"
                            component={StaffListScreen}
                        />
                    </Col>
                </Row>
                <Row>
                    <Col>
                        <Footer />
                    </Col>
                </Row>
            </Router>
        );
    }
}

export default App;

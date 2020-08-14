import React, { Component } from "react";
import "./App.css";
import { Route, NavLink, BrowserRouter as Router } from "react-router-dom";
import { Row, Nav, Col } from "react-bootstrap";

import ContactUs from "./Components/ContactUs";
import Login from "./Components/Login";
import About from "./Components/About";
import Home from "./Components/Home";
import StaffListScreen from "./Components/StaffListScreen";
import AdminPanel from './Components/AdminPanel';
import Footer from './Components/Footer';
import CustomNavbar from './Components/CustomNavbar';

class App extends Component {
  render() {
    return (
      <Router>
        <Row>
          <Col>
            <header>
              <h1>Roster Application</h1>
            </header>
          </Col>
        </Row>
        <Row>
          <Col>
            <CustomNavbar />
          </Col>
        </Row>
        <Row>
          <Col>
            <Route path="/about" component={About} />
            <Route path="/contact" component={ContactUs} />
            <Route path="/admin" component={AdminPanel} />
            <Route path="/login" component={Login} />
            <Route exact path="/" component={Home} />
            <Route path="/StaffListScreen" component={StaffListScreen} />
          </Col>
        </Row>
        <Row>
          <Col>
            <Footer />
          </Col>
        </Row>
      </Router >
    );
  }
}

export default App;

import React, { Component } from 'react';
import './App.css';
import { Route, NavLink, BrowserRouter as Router } from "react-router-dom";
import { Row, Nav, Col } from 'react-bootstrap';

import ContactUs from "./Components/ContactUs";
import Login from "./Components/Login";
import AboutUs from "./Components/AboutUs";
import Home from "./Components/Home";
import AdminPanel from './Components/AdminPanel';

class App extends Component {

  render() {
    return (
      <Router>
        <header>
          <Row className="justify-content-center">
            <Col sm={12} md={{ span: 6, offset: 3 }}>
              <h2>Roster Application</h2>
            </Col>
          </Row>
          <Row>
            <Col>
              <Nav fill variant="pills" defaultActiveKey="/Home">
                <Nav.Item>
                  <NavLink exact to="/">Home</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink to="/AboutUs">About Us</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink to="/ContactUs">Contact Us</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink to="/Login">Login</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink to="/Admin">Admin</NavLink>
                </Nav.Item>
              </Nav>
            </Col>
          </Row>
        </header>
        <Row>
          <Col>
            <Route path="/AboutUs" component={AboutUs} />
            <Route path="/ContactUs" component={ContactUs} />
            <Route path="/Admin" component={AdminPanel} />
            <Route path="/Login" component={Login} />
            <Route exact path="/" component={Home} />
          </Col>
        </Row>
      </Router>
    );
  }
}

export default App;

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
import Register from "./Components/Register";

class App extends Component {
  render() {
    return (
      <Router>
        <Row>
          <Col>
            <header>
              <h1>
                <center>Roster Application</center>{" "}
              </h1>
            </header>
          </Col>
        </Row>
        <CustomNavbar />

        {/* <div class="row content">


          <MiddleContainer />
        </div> */}

        {/* <Footer /> */}
        {/* <footer class="container-fluid text-center">
          <p>Footer Text</p>
        </footer> */}
        <Row>
          <Col>
            <Route path="/about" component={About} />
            <Route path="/contact" component={ContactUs} />
            <Route path="/admin" component={AdminPanel} />
            <Route path="/register" component={Register} />
            <Route path="/login" component={Login} />
            <Route exact path="/" component={Home} />
            <Route path="/StaffListScreen" component={StaffListScreen} />
            <Route path="/StaffNewScreen" component={StaffNewScreen} />
            <Route path="/StaffEditScreen" component={StaffEditScreen} />
          </Col>
        </Row>

        {/* GJ: removed the ROW and COL tags as this was preventing the footer in being on the botom */}
        <footer class="container-fluid text-center glenfooter">
          <p>Footer Text</p>
        </footer>
      </Router>
    );
  }
}

export default App;

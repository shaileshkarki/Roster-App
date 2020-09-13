import React, { useState, useMemo } from "react";
import "./App.css";
import { Route, NavLink, BrowserRouter as Router } from "react-router-dom";
import { MDBContainer, MDBRow, MDBCol } from "mdbreact";
import ContactUs from "./Components/ContactUs";
import Login from "./Components/Login";
import About from "./Components/About";
import Home from "./Components/Home";
import StaffListScreen from "./Components/StaffListScreen";
import StaffNewScreen from "./Components/StaffNewScreen";
import StaffEditScreen from "./Components/StaffEditScreen";
import AdminPanel from "./Components/AdminPanel";
import Footer from "./Components/Footer";
import NavbarPage from "./Components/NavbarPage";
import Register from "./Components/Register";
import PublicHolidays from "./Components/PublicHolidays";
import RosterScreen from "./Components/Roster/RosterScreen";
import CreateRosterScreen from "./Components/Roster/CreateRosterScreen";
import AdminShiftScreen from "./Components/Admin/AdminShiftScreen";
import Wages from "./Components/Wages/Wages"; // 02/09 GJ: Added View Wages component
import WeeklyWageRoster from "./Components/Wages/ViewWeeklyWageRoster"; //06/09 GJ: added this to support PDF output of weekly wages
import WeeklyWageJobRoster from "./Components/Wages/ViewWeeklyJobWageRoster"; //07/09: GJ added
import WeeklyWageStaffWagesRoster from "./Components/Wages/ViewWeeklyStaffWagesRoster"; //07/09: GJ added
import CreateGroup from "./Components/Group/CreateGroup";
import ViewGroups from "./Components/Group/ViewGroups";
import GroupEditScreen from "./Components/Group/GroupEditScreen";

import ViewRoster from "./Components/Roster/ViewRoster";
import WeeklyRoster from "./Components/Roster/WeeklyRoster";
import RosterTemplate from "./Components/Roster/RosterTemplate";
import ViewRosterScreen from "./Components/Roster/ViewRosterScreen";
import RosterAdmin from "./Components/Admin/RosterAdmin";
import PrivateRoute from "./PrivateRoute";
import { AuthContext } from "./context/auth";

function App(props) {
  const existingTokens = JSON.parse(localStorage.getItem("tokens"));
  console.log("existingitem", existingTokens);
  const [authTokens, setAuthTokens] = useState(existingTokens);

  const setTokens = (data) => {
    localStorage.setItem("tokens", JSON.stringify(data));
    setAuthTokens(data);
  };
  return (
    <AuthContext.Provider value={{ authTokens, setAuthTokens: setTokens }}>
      <Router>
        <MDBContainer className="wrapper screen-font" fluid>
          <MDBRow className="header">
            <MDBCol size="12" sm="12" lg="12">
              <header>
                <h1>
                  <center>Roster Application</center>{" "}
                </h1>
              </header>
            </MDBCol>
          </MDBRow>
          <MDBRow className="navigation">
            <MDBCol size="12" sm="12" md="12" lg="12" xl="12">
              <NavbarPage />
            </MDBCol>
          </MDBRow>
          <MDBRow className="main-content">
            <MDBCol size="12" sm="12" md="12" lg="12" xl="12">
              {/* 02/09 GJ: Added View Wages component */}
              <Route path="/wages" component={Wages} />
              <Route
                path="/viewWeeklyWages/:rosterID"
                component={WeeklyWageRoster}
              />
              {/* 07/09: GJ: Added this */}
              <Route
                path="/viewWeeklyJobWages/:rosterID"
                component={WeeklyWageJobRoster}
              />
              {/* 07/09: GJ: Added this */}
              <Route
                path="/viewWeeklyStaffWages/:username"
                component={WeeklyWageStaffWagesRoster}
              />
              <PrivateRoute path="/rosterAdmin" component={RosterAdmin} />
              <PrivateRoute path="/ViewRoster" component={RosterScreen} />
              <PrivateRoute path="/ViewRosterScreen" component={ViewRoster} />

              <PrivateRoute
                path="/ViewRosterScreen2"
                component={ViewRosterScreen}
              />
              <Route path="/about" component={About} />
              <Route path="/contact" component={ContactUs} />
              <PrivateRoute path="/admin" component={AdminPanel} />
              <Route path="/register" component={Register} />
              <Route path="/login" component={Login} />

              {authTokens != null &&
              (authTokens.role.includes("Manager") ||
                authTokens.role.includes("Supervisor")) ? (
                <>
                  <PrivateRoute
                    path="/StaffNewScreen"
                    component={StaffNewScreen}
                  />
                  <PrivateRoute
                    path="/StaffEditScreen"
                    component={StaffEditScreen}
                  />
                  <PrivateRoute path="/ViewGroups" component={ViewGroups} />
                  <PrivateRoute
                    path="/GroupEditScreen"
                    component={GroupEditScreen}
                  />
                  <PrivateRoute
                    path="/CreateRosterScreen"
                    component={CreateRosterScreen}
                  />
                  <PrivateRoute path="/createGroup" component={CreateGroup} />
                  <PrivateRoute
                    path="/StaffListScreen"
                    component={StaffListScreen}
                  />
                </>
              ) : (
                "" // alert("Only managers and supervisors can add or edit")
              )}
              <PrivateRoute path="/PublicHolidays" component={PublicHolidays} />
              <PrivateRoute
                path="/viewWeeklyRoster/:rosterID"
                component={WeeklyRoster}
              />
              <PrivateRoute
                path="/AdminShiftScreen"
                component={AdminShiftScreen}
              />
              <Route exact path="/" component={Home} />
            </MDBCol>
          </MDBRow>
        </MDBContainer>
      </Router>
    </AuthContext.Provider>
  );
}

export default App;

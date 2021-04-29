import React, { useState, useMemo } from "react";
import "./App.css";

import {
  Redirect,
  Route,
  NavLink,
  Switch,
  BrowserRouter as Router,
} from "react-router-dom";
import { MDBContainer, MDBRow, MDBCol, MDBTypography } from "mdbreact";
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
import NoRouteComponent from "./Components/NoRouteComponent";
import ViewRoster from "./Components/Roster/ViewRoster";
import WeeklyRoster from "./Components/Roster/WeeklyRoster";
import RosterTemplate from "./Components/Roster/RosterTemplate";
import ViewRosterScreen from "./Components/Roster/ViewRosterScreen";
import RosterAdmin from "./Components/Admin/RosterAdmin";
import PrivateRoute from "./PrivateRoute";
import { AuthContext } from "./context/auth";

function App(props) {
  const existingTokens = JSON.parse(sessionStorage.getItem("tokens"));
  console.log("existingitem", existingTokens);
  const [authTokens, setAuthTokens] = useState(existingTokens);

  const setTokens = (data) => {
    sessionStorage.setItem("tokens", JSON.stringify(data));
    setAuthTokens(data);
  };
  return (
    <AuthContext.Provider value={{ authTokens, setAuthTokens: setTokens }}>
      <Router>
        <Switch>
          <MDBContainer className="wrapper screen-font" fluid>
            <MDBRow className="header">
              <MDBCol size="12" sm="12" lg="12">
                <MDBTypography tag="h1" variant="h1-responsive">
                  <center>Roster Application</center>{" "}
                </MDBTypography>
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
                <PrivateRoute exact path="/wages" component={Wages} />
                <PrivateRoute
                  exact
                  path="/viewWeeklyWages/:rosterID"
                  component={WeeklyWageRoster}
                />
                {/* 07/09: GJ: Added this */}
                <PrivateRoute
                  exact
                  path="/viewWeeklyJobWages/:rosterID"
                  component={WeeklyWageJobRoster}
                />
                {/* 07/09: GJ: Added this */}
                <PrivateRoute
                  exact
                  path="/viewWeeklyStaffWages/:username"
                  component={WeeklyWageStaffWagesRoster}
                />
                <PrivateRoute
                  exact
                  path="/rosterAdmin"
                  component={RosterAdmin}
                />
                <PrivateRoute
                  exact
                  path="/ViewRoster"
                  component={RosterScreen}
                />
                <PrivateRoute
                  exact
                  path="/ViewRosterScreen"
                  component={ViewRoster}
                />
                <PrivateRoute
                  exact
                  path="/ViewRosterScreen2"
                  component={ViewRosterScreen}
                />
                <Route exact path="/about" component={About} />
                <Route exact path="/contact" component={ContactUs} />
                <PrivateRoute exact path="/admin" component={AdminPanel} />
                <Route exact path="/register" component={Register} />
                <Route exact path="/login" component={Login} />
                {authTokens != null &&
                (authTokens.role.includes("Manager") ||
                  authTokens.role.includes("Supervisor")) ? (
                  <>
                    <PrivateRoute
                      exact
                      path="/StaffNewScreen"
                      component={StaffNewScreen}
                    />
                    <PrivateRoute
                      exact
                      path="/StaffEditScreen"
                      component={StaffEditScreen}
                    />
                    <PrivateRoute
                      exact
                      path="/ViewGroups"
                      component={ViewGroups}
                    />
                    <PrivateRoute
                      exact
                      path="/GroupEditScreen"
                      component={GroupEditScreen}
                    />
                    <PrivateRoute
                      exact
                      path="/CreateRosterScreen"
                      component={CreateRosterScreen}
                    />
                    <PrivateRoute
                      exact
                      path="/createGroup"
                      component={CreateGroup}
                    />
                    <PrivateRoute
                      exact
                      path="/StaffListScreen"
                      component={StaffListScreen}
                    />
                  </>
                ) : (
                  "" // alert("Only managers and supervisors can add or edit")
                )}
                <PrivateRoute
                  exact
                  path="/PublicHolidays"
                  component={PublicHolidays}
                />
                <PrivateRoute
                  exact
                  path="/viewWeeklyRoster/:rosterID"
                  component={WeeklyRoster}
                />
                <PrivateRoute
                  exact
                  path="/AdminShiftScreen"
                  component={AdminShiftScreen}
                />
                <Route exact path="/" component={Home} />
              </MDBCol>
            </MDBRow>
          </MDBContainer>
          <Route exact path="/:noRoute" component={NoRouteComponent} />
        </Switch>
      </Router>
    </AuthContext.Provider>
  );
}

export default App;

import React from "react";
import Roster from "./Roster";
function RosterScreen({ location }) {
  console.log("location", location.state);

  return <Roster data={location.state[0]} />;
}

export default RosterScreen;

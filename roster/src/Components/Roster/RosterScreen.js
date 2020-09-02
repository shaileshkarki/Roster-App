import React from "react";
import Roster from "./Roster";
function RosterScreen({ location }) {
  console.log("location", location.state);

  return (
    <Roster
      shifts={location.state[0]}
      groups={location.state[1]}
      weekNumber={location.state[2]}
      create={true}
    />
  );
}

export default RosterScreen;

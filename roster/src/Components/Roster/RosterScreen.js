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
      startDate={location.state[3]}
      endDate={location.state[4]}
      title={location.state[5]}
    />
  );
}

export default RosterScreen;

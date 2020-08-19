import React from "react";
import Button from "react-bootstrap/Button";

class LeftSidebar extends React.Component {
  render() {
    return (
      <div class="sidenav">
        <div class="btn btn-block">
          <Button
            variant="primary"
            href="/StaffListScreen"
            block
            className="mb-5"
          >
            Add Staff
          </Button>

          <Button className="mb-5" variant="warning" href="#" block>
            Update Staff
          </Button>

          <Button className="mb-5" variant="danger" href="#" block>
            Delete Staff
          </Button>

          <Button className="mb-5" variant="primary" href="#" xs={12} block>
            View Roster
          </Button>

          <Button className="mb-5" variant="warning" href="#" xs={12} block>
            Update Roster
          </Button>

          <Button className="mb-5" variant="danger" href="#" xs={12} block>
            Create Roster
          </Button>
        </div>
      </div>
    );
  }
}

export default LeftSidebar;

import React from "react";
import Button from "react-bootstrap/Button";

class LeftSidebar extends React.Component {
    render() {
        return (
            <div class="col-sm-2 sidenav">
                <p>
                    <Button variant="primary" size="sm" href="/StaffListScreen">
                        Add Staff
          </Button></p>
                <p>
                    <Button variant="warning" size="sm" href="#">
                        Update Staff
          </Button></p>
                <p>
                    <Button variant="danger" size="sm" href="#">
                        Delete Staff
          </Button>
                </p>
                <p>
                    <Button
                        variant="primary"
                        size="sm"
                        href="#"
                        xs={12}
                        md={{ span: 2, offset: 0 }}
                    >
                        View Roster
          </Button>
                </p>
                <p>
                    <Button
                        variant="warning"
                        size="sm"
                        href="#"
                        xs={12}
                        md={{ span: 2, offset: 0 }}
                    >
                        Update Roster
          </Button>
                </p>
                <p>
                    <Button
                        variant="danger"
                        size="sm"
                        href="#"
                        xs={12}
                        md={{ span: 2, offset: 0 }}
                    >
                        Create Roster
          </Button>
                </p>
            </div >
        );
    }
}

export default LeftSidebar;

import React from "react";
import Button from "react-bootstrap/Button";

class LeftSidebar extends React.Component {
    render() {
        return (
            <div class="col-sm-2 sidenav">
                <div class="btn btn-block">
                    <p>
                        <Button
                            variant="primary"
                            size="sm"
                            href="/StaffListScreen"
                            block
                        >
                            Add Staff
                        </Button>
                    </p>
                    <p>
                        <Button variant="warning" size="sm" href="#" block>
                            Update Staff
                        </Button>
                    </p>
                    <p>
                        <Button variant="danger" size="sm" href="#" block>
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
                            block
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
                            block
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
                            block
                        >
                            Create Roster
                        </Button>
                    </p>
                </div>
            </div>
        );
    }
}

export default LeftSidebar;

import React from "react";
import Button from "react-bootstrap/Button";

class LeftSidebar extends React.Component {
    render() {
        return (
            <div class="sidenav" style={{ width: "50%", margin: "0 auto" }}>
                <div class="btn btn-block">

                    <Button

                        variant="primary"
                        size="sm"
                        href="/StaffListScreen"
                        block
                        className="mb-5"

                    >
                        Add Staff
                        </Button>


                    <Button className="mb-5" variant="warning" size="sm" href="#" block>
                        Update Staff
                        </Button>


                    <Button className="mb-5" variant="danger" size="sm" href="#" block>
                        Delete Staff
                        </Button>


                    <Button
                        className="mb-5"
                        variant="primary"
                        size="sm"
                        href="#"
                        xs={12}

                        block
                    >
                        View Roster
                        </Button>


                    <Button
                        className="mb-5"
                        variant="warning"
                        size="sm"
                        href="#"
                        xs={12}

                        block
                    >
                        Update Roster
                        </Button>


                    <Button
                        className="mb-5"
                        variant="danger"
                        size="sm"
                        href="#"
                        xs={12}
                        block
                    >
                        Create Roster
                        </Button>

                </div>
            </div>
        );
    }
}

export default LeftSidebar;

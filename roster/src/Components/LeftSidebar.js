import React from "react";
import Button from "react-bootstrap/Button";

class LeftSidebar extends React.Component {
    render() {
        return (
            <div class="">
                <div class="btn">
                    <Button
                        variant="primary"
                        href="/StaffListScreen"
                        // block
                        className="mb-1"
                        xs={12}
                    >
                        Add Staff
                    </Button>

                    <Button className="mb-1" variant="warning" href="#" xs={12}>
                        Update Staff
                    </Button>

                    <Button className="mb-1" variant="danger" href="#" xs={12}>
                        Delete Staff
                    </Button>

                    <Button className="mb-1" variant="primary" href="#" xs={12}>
                        View Roster
                    </Button>

                    <Button className="mb-1" variant="warning" href="#" xs={12}>
                        Update Roster
                    </Button>

                    <Button className="mb-1" variant="danger" href="#" xs={12}>
                        Create Roster
                    </Button>

                    <Button className="mb-1" variant="primary" href="#" xs={12}>
                        Refresh PHol
                    </Button>
                </div>
            </div>
        );
    }
}

export default LeftSidebar;

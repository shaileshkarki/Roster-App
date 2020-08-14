import React from "react";
import Button from "react-bootstrap/Button";

class ReportsFooter extends React.Component {
    render() {
        return (
            <footer class="reportBackgroundColor container-fluid text-center">
                <Button className="reportButton"
                    variant="primary"
                    size="sm"
                    href="#"
                    xs={12}
                    md={{ span: 2, offset: 1 }}
                >
                    Worked Hours Report
          </Button>
                <Button className="reportButton"
                    variant="primary"
                    size="sm"
                    href="#"
                    xs={12}
                    md={{ span: 2, offset: 1 }}
                >
                    Salry Report
          </Button>
                <Button className="reportButton"
                    variant="primary"
                    size="sm"
                    href="#"
                    xs={12}
                    md={{ span: 2, offset: 1 }
                    }
                >
                    Other Report
          </Button >

            </footer >
        );
    }
}

export default ReportsFooter;


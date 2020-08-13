import React from "react";
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Button from 'react-bootstrap/Button';

function AdminPanel(props) {
    return (
        <div>
            <Row >
                <Col xs={{ span: 8, offset: 2 }} md={{ span: 2, offset: 2 }}><label>Worker Admin:</label></Col>
                <Col xs={{ span: 8, offset: 2 }} md={{ span: 2, offset: 0 }}><Button variant="primary" size="lg" href="#" >Add Worker Details</Button></Col>
                <Col xs={{ span: 8, offset: 2 }} md={{ span: 2, offset: 0 }}><Button variant="warning" size="lg" href="#">Update Worker Details</Button></Col>
                <Col xs={{ span: 8, offset: 2 }} md={{ span: 2, offset: 0 }}><Button variant="danger" size="lg" href="#">Delete Worker Details</Button></Col>
            </Row>
            <Row>
                <Col xs={{ span: 8, offset: 3 }} md={{ span: 2, offset: 2 }}><label>Roster Admin:</label></Col>
                <Col xs={{ span: 8, offset: 2 }} md={{ span: 2, offset: 0 }}><Button variant="primary" size="lg" href="#" xs={12} md={{ span: 2, offset: 0 }}>View Current Roster</Button></Col>
                <Col xs={{ span: 8, offset: 2 }} md={{ span: 2, offset: 0 }}><Button variant="warning" size="lg" href="#" xs={12} md={{ span: 2, offset: 0 }}>Update Roster</Button></Col>
                <Col xs={{ span: 8, offset: 2 }} md={{ span: 2, offset: 0 }}><Button variant="danger" size="lg" href="#" xs={12} md={{ span: 2, offset: 0 }}>Create Future Roster</Button></Col>
            </Row>
            <Row>
                <Col xs={{ span: 8, offset: 2 }} md={{ span: 2, offset: 2 }}><label>Report Admin:</label></Col>
                <Col xs={{ span: 8, offset: 2 }} md={{ span: 2, offset: 0 }}><Button variant="info" size="lg" href="#" xs={12} md={{ span: 2, offset: 0 }}>Worked Hours Report</Button></Col>
                <Col xs={{ span: 8, offset: 2 }} md={{ span: 2, offset: 0 }}><Button variant="info" size="lg" href="#" xs={12} md={{ span: 2, offset: 0 }}>Salry Report</Button></Col>
                <Col xs={{ span: 8, offset: 2 }} md={{ span: 2, offset: 0 }}><Button variant="info" size="lg" href="#" xs={12} md={{ span: 2, offset: 0 }}>Other Report</Button></Col>
            </Row>
        </div>
    )
}

export default AdminPanel;
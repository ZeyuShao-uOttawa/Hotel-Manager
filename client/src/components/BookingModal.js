import React, { Fragment, useState } from 'react';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Modal from 'react-bootstrap/Modal';
import InputGroup from 'react-bootstrap/InputGroup';

const BookingModal = () => {
  const [show, setShow] = useState(false);

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  return (
    <Fragment>
      <Button variant="primary" onClick={handleShow}>
        Book Room
      </Button>

      <Modal show={show} onHide={handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Book Room</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <InputGroup className="mb-3" controlId="bookingForm.SSN">
              <InputGroup.Text>Social Security Number:</InputGroup.Text>
              <Form.Control placeholder="SSN" autoFocus />
            </InputGroup>
            <InputGroup className="mb-3" controlId="bookingForm.Name">
              <InputGroup.Text>Full Name:</InputGroup.Text>
              <Form.Control placeholder="John Doe" />
            </InputGroup>
            <InputGroup className="mb-3" controlId="bookingForm.Address">
              <InputGroup.Text>Address:</InputGroup.Text>
              <Form.Control placeholder="123 Center Town, Ottawa" />
            </InputGroup>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClose}>
            Close
          </Button>
          <Button variant="success" onClick={handleClose}>
            Book Room
          </Button>
        </Modal.Footer>
      </Modal>
    </Fragment>
  );
};

export default BookingModal;
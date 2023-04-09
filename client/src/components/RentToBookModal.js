import React, { Fragment, useState } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';

const RentToBookModal = (props) => {
    const [show, setShow] = useState(false);


    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    const changeRental = async () => {
        try {
            const startDate = props.startDate;
            const endDate = props.endDate;
            const roomID = props.roomID;
            const bookingID = props.bookingID;
            const ssn = props.ssn;
            const data = {startDate,endDate,roomID,bookingID,ssn}
            const resRent = fetch("http://localhost:5000/createRental", {
                method: "POST",
                headers: {"Content-Type": "application/json"},
                body: JSON.stringify(data)
            }); 

            const secondData = {roomID}

            const resBook = fetch("http://localhost:5000/deleteBooking", {
                method: "POST",
                headers: {"Content-Type": "application/json"},
                body: JSON.stringify(secondData)
            })

            
            handleClose();
            
        } catch (err) {
            console.log(err);
        }
    }


    return (
        <Fragment>
            <Button variant = "primary" onClick = {handleShow}>
                Change Status
            </Button>

            <Modal show = {show} onHide = {handleClose}>
                <Modal.Header closeButton>
                    <Modal.Title>Change Booking To Rental</Modal.Title>
                </Modal.Header>
                <Modal.Footer>
                    <Button variant = "secondary" onClick = {handleClose}>
                        Close
                    </Button>
                    <Button variant = "success" onClick={changeRental}>
                    Change Booking To Rental
                    </Button>

                </Modal.Footer>
            </Modal>
        </Fragment>
    );
}
export default RentToBookModal;
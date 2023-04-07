import React, { Fragment, useEffect, useState } from 'react';
import Table from 'react-bootstrap/Table';
import Form from 'react-bootstrap/Form';
import InputGroup from 'react-bootstrap/InputGroup';
import BookingModal from './BookingModal.js';

const CustomerView = () => {

    const [rooms, setRooms] = useState([]);
    const [filteredRooms, setFilteredRooms] = useState([]);
    const [price, setPrice] = useState(1000);
    const [numRooms, setNumRooms] = useState(1000);

    var set1, set2;

    var currentDateObj = new Date();
    var utcDate = new Date(Date.UTC(currentDateObj.getFullYear(), currentDateObj.getMonth(), currentDateObj.getDate()));
    var utcNextDate = new Date(Date.UTC(currentDateObj.getFullYear(), currentDateObj.getMonth(), currentDateObj.getDate() + 1));
    const currentDate = utcDate.toJSON().slice(0,10);
    const nextDate = utcNextDate.toJSON().slice(0,10);

    const [selectedStartDate, setSelectedStartDate] = useState(currentDate);
    const [selectedEndDate, setSelectedEndDate] = useState(nextDate);
    const [selectedMinEndDate, setSelectedMinEndDate] = useState(nextDate);
    
    const getRooms = async () => {
        try {
            const date = {selectedStartDate, selectedEndDate};
            const res = await fetch("http://localhost:5000/freeRoomsDate", {
                method: "POST",
                headers: {"Content-Type": "application/json"},
                body: JSON.stringify(date)
            });
            // const res = await fetch('http://localhost:5000/rooms');
            const jsonData = await res.json();
            setRooms(jsonData);
            setFilteredRooms(jsonData);
            console.log(jsonData.length);
        } catch (err) {
            console.error(err.message);
        }
    }

    function handleStartDateChange(event) {
        setSelectedStartDate(event.target.value);
        var dateObj = new Date(event.target.value);
        var tempDate = new Date(Date.UTC(dateObj.getFullYear(), dateObj.getMonth(), dateObj.getDate() + 2));
        const tempEndDate = tempDate.toJSON().slice(0,10);
        setSelectedMinEndDate(tempEndDate);
        if(event.target.value >= selectedEndDate){
            setSelectedEndDate(tempEndDate);
        }
    }

    function handleEndDateChange(event) {
        setSelectedEndDate(event.target.value);
      }
    
    const handleChangePrice = (event) => {
        setPrice(event.target.value);
        
    };

    const handleChangeRooms = (event) => {
        setNumRooms(event.target.value);
    };

    useEffect(() => {
        getRooms();
    }, [selectedStartDate, selectedEndDate]);

    useEffect(() => {

    }, []);

    return (
        <Fragment>
            <h2>Hotel Room Booking</h2>
            <div>
                <Form>
                    <InputGroup className="mb-3">
                        <InputGroup.Text>Start Date:</InputGroup.Text>
                        <Form.Control type="date" id="startDate" name="trip-start" min={currentDate} max="2024-12-31" value={selectedStartDate} onChange={handleStartDateChange}/>
                        <InputGroup.Text>End Date:</InputGroup.Text>
                        <Form.Control type="date" id="endDate" name="trip-end" min={selectedMinEndDate} max="2024-12-31" value={selectedEndDate} onChange={handleEndDateChange}/>
                        <InputGroup.Text>Room Capacity:</InputGroup.Text>
                        <Form.Select aria-label="Select Room Capacity">
                            <option value="none">Select Room Capacity</option>
                            <option value="single">Single</option>
                            <option value="double">Double</option>
                            <option value="studio">Studio</option>
                            <option value="deluxe">Deluxe</option>
                            <option value="suite">Suite</option>
                        </Form.Select>
                        <InputGroup.Text>City:</InputGroup.Text>
                        <Form.Select aria-label="Select City">
                            <option value="none">Select City</option>
                            <option value="Montreal">Montreal</option>
                            <option value="Sherbrooke">Sherbrooke</option>
                            <option value="Quebec">Quebec</option>
                            <option value="Laval">Laval</option>
                            <option value="Ottawa">Ottawa</option>
                            <option value="Gatineau">Gatineau</option>
                            <option value="Toronto">Toronto</option>
                            <option value="Brampton">Brampton</option>
                            <option value="Hamilton">Hamilton</option>
                            <option value="Mississauga">Mississauga</option>
                            <option value="Calgary">Calgary</option>
                            <option value="Edmonton">Edmonton</option>
                            <option value="Vancouver">Vancouver</option>
                            <option value="Burnaby">Burnaby</option>
                            <option value="Victoria">Victoria</option>
                            <option value="Richmond">Richmond</option>
                        </Form.Select>
                    </InputGroup>
                    <InputGroup className="mb-3">
                        <InputGroup.Text>Hotel Chain:</InputGroup.Text>
                        <Form.Select aria-label="Select Hotel Chain">
                            <option value="none">Select Hotel Chain</option>
                            <option value="1">Hotel Chain 1</option>
                            <option value="2">Hotel Chain 2</option>
                            <option value="3">Hotel Chain 3</option>
                            <option value="4">Hotel Chain 4</option>
                            <option value="5">Hotel Chain 5</option>
                        </Form.Select>
                        <InputGroup.Text>Hotel Rating:</InputGroup.Text>
                        <Form.Select aria-label="Select Hotel Rating">
                            <option value="none">Select Hotel Rating</option>
                            <option value="1">1 Star</option>
                            <option value="2">2 Star</option>
                            <option value="3">3 Star</option>
                            <option value="4">4 Star</option>
                            <option value="5">5 Star</option>
                        </Form.Select>
                    </InputGroup>
                    <Form.Group controlId="minPrice">
                        <Form.Label>Max Rooms in Hotel: {numRooms} Rooms</Form.Label>
                        <Form.Range value={numRooms} min='0' max='1000' onChange={handleChangeRooms} />
                    </Form.Group>
                    <Form.Group controlId="minPrice">
                        <Form.Label>Max Price: ${price}</Form.Label>
                        <Form.Range value={price} min='0' max='1000' onChange={handleChangePrice} />
                    </Form.Group>
                    
                </Form>
            </div>
            <Table striped bordered hover>
            <thead>
                <tr>
                    <th>Room ID</th>
                    <th>Hotel Name</th>
                    <th>Hotel Rating</th>
                    <th>Hotel Rooms</th>
                    <th>Room Capacity</th>
                    <th>Price</th>
                    <th>Address</th>
                    <th>Book Room</th>
                </tr>
            </thead>
            <tbody>
                {rooms.map(room => (
                    <tr>
                        <td>{room.room_id}</td>
                        <td>Hotel Chain {room.hc_id}</td>
                        <td>{room.rating} Star</td>
                        <td>{room.num_rooms} Rooms</td>
                        <td>{room.capacity}</td>
                        <td>${room.price}</td>
                        <td>{room.address}</td>
                        <td><BookingModal /></td>
                    </tr>
                ))}
            </tbody>
            </Table>
        </Fragment>
    );
};

export default CustomerView;
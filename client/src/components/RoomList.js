import React, { Fragment, useEffect, useState } from 'react';
import Table from 'react-bootstrap/Table';

const RoomList = () => {

    const [rooms, setRooms] = useState([]);

    const getRooms = async () => {
        try {
            const res = await fetch('http://localhost:5000/rooms');
            const jsonData = await res.json();
            setRooms(jsonData);
        } catch (err) {
            console.error(err.message);
        }
    }

    useEffect(() => {
        getRooms();
    }, []);

    return (
        <Fragment>
            <Table striped bordered hover>
            <thead>
                <tr>
                    <th>Room ID</th>
                    <th>Hotel Name</th>
                    <th>Hotel Rating</th>
                    <th>Room Capacity</th>
                    <th>Price</th>
                    <th>Address</th>
                </tr>
            </thead>
            <tbody>
                    {/* <td>1</td>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td colSpan={2}>Larry the Bird</td>
                    <td>@twitter</td> */}
                {rooms.map(room => (
                    <tr>
                        <td>{room.room_id}</td>
                        <td>Hotel Chain_{room.hc_id}</td>
                        <td>{room.rating} Star</td>
                        <td>{room.capacity}</td>
                        <td>${room.price}</td>
                        <td>{room.address}</td>
                    </tr>
                ))}
            </tbody>
            </Table>
        </Fragment>
    );
}

export default RoomList;
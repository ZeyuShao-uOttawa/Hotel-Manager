import React, { Fragment, useEffect, useState } from 'react';
import Table from 'react-bootstrap/Table';
import { Tab, Tabs } from 'react-bootstrap';

const EmployeeView = (props) => {

  console.log(props.update);

  const [rooms, setRooms] = useState([]);
  const [customers, setCustomers] = useState([]);
  const [employees, setEmployees] = useState([]);
  const [tabKey, initTabKey] = useState('one');

  const getRooms = async () => {
    try {
      const res = await fetch('http://localhost:5000/rooms');
      const jsonData = await res.json();
      setRooms(jsonData);
    } catch (err) {
      console.error(err.message);
    }
  }

  const getCustomers = async () => {
    try {
      const res = await fetch('http://localhost:5000/customers');
      const jsonData = await res.json();
      setCustomers(jsonData);
    } catch (err) {
      console.error(err.message);
    }
  }

  const getEmployees = async () => {
    try {
      const res = await fetch('http://localhost:5000/employees');
      const jsonData = await res.json();
      setEmployees(jsonData);
    } catch (err) {
      console.error(err.message);
    }
  }

  useEffect(() => {
    getRooms();
    getCustomers();
    getEmployees();
  }, []);

  useEffect(() => {
    getCustomers();
    console.log("Reached");
  }, [props.update]);


  return (
    <Fragment>
      <div className='container'>
        <h2 className="mb-3 text-center">Employee View</h2>
        <Tabs activeKey={tabKey} onSelect={(e) => initTabKey(e)}>
          <Tab eventKey="one" title="Rooms">
            <h2>List of Rooms</h2>
            <Table striped bordered hover>
              <thead>
                <tr>
                  <th>Room ID</th>
                  <th>Room Number</th>
                  <th>Price</th>
                  <th>Capacity</th>
                  <th>Outside View</th>
                  <th>Extendable</th>
                  <th>Damages</th>
                  <th>Is Rented</th>
                  <th>Hotel ID</th>
                </tr>
              </thead>
              <tbody>
                {rooms.map(room => (
                  <tr key={room.room_id}>
                    <td>{room.room_id}</td>
                    <td>{room.room_num}</td>
                    <td>{room.price}</td>
                    <td>{room.capacity}</td>
                    <td>{room.outside_view}</td>
                    <td>{room.can_be_extended ? "True" : "False"}</td>
                    <td>{room.has_damage ? "True" : "False"}</td>
                    <td>{room.is_rented ? "True" : "False"}</td>
                    <td>{room.hotel_id}</td>
                  </tr>
                ))}
              </tbody>
            </Table>
          </Tab>
          <Tab eventKey="two" title="Customers">
            <h2>List of Customers</h2>
            <Table striped bordered hover>
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Address</th>
                  <th>Registration Date</th>
                </tr>
              </thead>
              <tbody>
                {customers.map(customer => (
                  <tr key={customer.id}>
                    <td>{customer.name}</td>
                    <td>{customer.address}</td>
                    <td>{customer.reg_date}</td>
                  </tr>
                ))}
              </tbody>
            </Table>
          </Tab>
          <Tab eventKey="three" title="Hotels">
            <h2>List of Hotels</h2>
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
                  </tr>
                ))}
              </tbody>
            </Table>
          </Tab>
          <Tab eventKey="four" title="Employees">
            <h2>List of Employees</h2>
            <Table striped bordered hover>
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Address</th>
                  <th>Role</th>
                  <th>Hotel ID</th>
                </tr>
              </thead>
              <tbody>
                {employees.map(employee => (
                  <tr>
                    <td>{employee.name}</td>
                    <td>{employee.address}</td>
                    <td>{employee.role_pos}</td>
                    <td>{employee.hotel_id}</td>
                  </tr>
                ))}
              </tbody>
            </Table>
          </Tab>
        </Tabs>

      </div>

    </Fragment>

  );
};

export default EmployeeView;
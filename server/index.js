const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");

// Middleware
app.use(cors());
app.use(express.json());

// ROUTES
// Creating new customer
app.post("/createCustomer", async(req, res) => {
  try {
    // console.log(req.body)
    const ssn = req.body.SSN;
    const name = req.body.name;
    const address = req.body.address;
    const newCustomer = await pool.query(
      "INSERT INTO customer VALUES($1, $2, $3, CURRENT_DATE)",
      [ssn, name, address]
      );
  } catch (err) {
    console.error(err.message);
  }
});

// Creating booking
app.post("/createBooking", async(req, res) => {
  try {
    const startDate = req.body.startDate;
    const endDate = req.body.endDate;
    const roomID = req.body.roomID;
    const ssn = req.body.ssn;
    const newBooking = await pool.query(
      "INSERT INTO booking(start_date, end_date, room_id, SSN) VALUES($1, $2, $3, $4)",
      [startDate, endDate, roomID, ssn]
      );
  } catch (err) {
    console.error(err.message);
  }
});


app.post("/deleteBooking", async(req, res) => {
  const roomID = req.body.roomID;
  try {
    const deleteRental = await pool.query(
      "DELETE FROM booking WHERE room_id = $1",
      [roomID]
      );
  } catch (err) {
    console.error(err.message);
  }
});


app.post("/createRental", async(req, res) => {
  try {
    const startDate = req.body.startDate;
    const endDate = req.body.endDate;
    const bookingID = req.body.bookingID;
    const roomID = req.body.roomID;
    const ssn = req.body.ssn;
    console.log(req.body);
    const newRental = await pool.query(
      "INSERT INTO renting(start_date, end_date, booking_id, room_id,ssn) VALUES($1, $2, $3, $4, $5)",
      [startDate, endDate,bookingID, roomID,ssn]
      );
  } catch (err) {
    console.error(err.message);
  }
});


// Get all hotels
app.get("/hotels", async(req, res) => {
  try {
    const allHotels = await pool.query("SELECT * FROM hotel");
    res.json(allHotels.rows);
    console.log("Successful query to get all hotels");
  } catch (err) {
    console.error(err.message);
  }
});

// Get all rooms
app.get("/rooms", async(req, res) => {
  try {
    const allRooms = await pool.query("SELECT * FROM room NATURAL JOIN hotel");
    res.json(allRooms.rows);
    console.log("Successful query to get all rooms");
  } catch (err) {
    console.error(err.message);
  }
});

// Get available rooms by date
app.post("/freeRoomsDate", async(req, res) => {
  try {
    const startDate = req.body.selectedStartDate;
    const endDate  = req.body.selectedEndDate;
    const allFreeRooms = await pool.query(
      "WITH roomID(id) as (SELECT DISTINCT room.room_id FROM room LEFT JOIN booking ON room.room_id = booking.room_id WHERE NOT EXISTS (SELECT 1 FROM booking WHERE booking.room_id = room.room_id AND booking.start_date < $1 AND booking.end_date > $2)) SELECT * FROM room, hotel, roomID WHERE room.hotel_id = hotel.hotel_id AND roomID.id = room.room_id",
      [endDate, startDate]
      );
    res.json(allFreeRooms.rows);
    console.log("Successful query to get all free rooms using dates");
  } catch (err) {
    console.error(err.message);
  }
});

// Get all customers
app.get("/customers", async (req, res) => {
  try {
    const allCustomers = await pool.query("SELECT * FROM customer");
    res.json(allCustomers.rows);
    console.log("Successful query to get all customers");
  } catch (err) {
    console.error(err.message);
  }
});

// Get all employees
app.get("/employees", async (req, res) => {
  try {
    const allEmployees = await pool.query("SELECT * FROM employee");
    res.json(allEmployees.rows);
    console.log("Successful query to get all employees");
  } catch (err) {
    console.error(err.message);
  }
});

// Get all bookings
app.get("/bookings", async (req, res) => {
  try {
    const allBookings = await pool.query("SELECT * FROM booking");
    res.json(allBookings.rows);
    console.log("Successful query to get all bookings");
  } catch (err) {
    console.error(err.message);
  }
});

//Get all rentals
app.get("/rentals", async (req, res) => {
  try {
    const allRentals = await pool.query("SELECT * FROM renting");
    res.json(allRentals.rows);
    console.log("Successful query to get all rentals");
  } catch (err) {
    console.error(err.message);
  }
});


app.listen(5000, () => {
  console.log("Server has started on port 5000");
});
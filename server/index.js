const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");

//Middleware
app.use(cors());
app.use(express.json());

//ROUTES
//Creating booking
app.post("/booking", async(req, res) => {
  try {
    const { booking } = req.body;
    const newBooking = await pool.query(
      "INSERT INTO booking () VALUES ($1)",
      [booking]
      );
  } catch (err) {
    console.error(err.message);
  }
});

//Get hotels
app.get("/hotels", async(req, res) => {
  try {
    const allHotels = await pool.query("SELECT * FROM hotel");
    res.json(allHotels.rows);
    console.log(allHotels.rows);
  } catch (err) {
    console.error(err.message);
  }
});

//Get rooms
app.get("/rooms", async(req, res) => {
  try {
    const allRooms = await pool.query("SELECT * FROM room NATURAL JOIN hotel");
    res.json(allRooms.rows);
    console.log("Successful Query");
  } catch (err) {
    console.error(err.message);
  }
});

//Get available rooms
app.get("/freeRooms", async(req, res) => {
  try {
    const allFreeRooms = await pool.query("SELECT * FROM room NATURAL JOIN hotel");
    res.json(allFreeRooms.rows);
    console.log("Successful Query");
  } catch (err) {
    console.error(err.message);
  }
});

app.listen(5000, () => {
  console.log("Server has started on port 5000");
});
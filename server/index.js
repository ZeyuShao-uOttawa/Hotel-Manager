const express = require("express");
const app = express();
const cors = require("cores");

//Middleware
app.use(cors());
app.use(express.json());

app.listen(5000, () => {
  console.log("Server has started on port 5000");
});
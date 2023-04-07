const Pool = require("pg").Pool;

const pool = new Pool({
  user: "postgres",
  password: "t%%rFYGLLy$Nm7mgzqz*v",
  host: "localhost",
  port: 5432,
  database: "hotel_management"
});

module.exports = pool;
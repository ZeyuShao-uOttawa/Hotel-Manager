const Pool = require("pg").Pool;

const pool = new Pool({
  user: "postgres",
  password: "Dontforgetthis1!",
  host: "localhost",
  port: 5432,
  database: "hotel_management"
});

module.exports = pool;
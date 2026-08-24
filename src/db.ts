import { Pool } from "pg";

const pool = new Pool({
  host: "localhost",
  port: 5432,
  database: "backend_db",
  user: "ehsan",
  password: "next",
});

export default pool;

import { Pool } from "pg";

const pool = new Pool({
  host: "localhost",
  port: 5433,
  database: "backend_db",
  user: "ehsan",
  password: "next",
});

export default pool;

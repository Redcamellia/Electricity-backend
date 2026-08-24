import express from "express";

import { router } from "./routes/user.routes";
import { logger } from "./middlewares/Logger";
import { apiKey } from "./middlewares/APIkey";
import { ErrorHandler } from "./middlewares/ErrorHandler";
import pool from "./db";

const app = express();
app.use(express.json());
app.use(logger);
app.use("/users", router);
app.get("/", async (req, res) => {
  const result = await pool.query("SELECT * FROM users ORDER BY id");
  res.json(result.rows);
});
app.use(ErrorHandler);
app.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});

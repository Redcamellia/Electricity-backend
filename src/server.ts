import express from "express";
import "dotenv/config";
import pool from "./db";
import { ErrorHandler } from "./middlewares/ErrorHandler";
import { logger } from "./middlewares/Logger";
import { authRouter } from "./routes/auth.routes";
import { userRouter } from "./routes/user.routes";
import cors from "cors";
const app = express();
app.use(
  cors({
    origin: "http://localhost:8081",
  }),
);
app.use(express.json());
app.use(logger);
app.use("/users", userRouter);
app.use("/auth", authRouter);
app.get("/", async (req, res) => {
  const result = await pool.query("SELECT * FROM users ORDER BY id");
  res.json(result.rows);
});
app.use(ErrorHandler);
app.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});

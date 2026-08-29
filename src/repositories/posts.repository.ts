import pool from "../db";
import AppError from "../Errors/appError";

export async function getAllPosts() {
  const result = await pool.query("SELECT * FROM posts;");
  return result.rows;
}

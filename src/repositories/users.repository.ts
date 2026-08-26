import pool from "../db";
import AppError from "../Errors/appError";
import { User } from "../types/User";

export async function getUserByEmail(email: string): Promise<User> {
  const queryResult = await pool.query(
    "SELECT name, email, id FROM users WHERE email=$1;",
    [email],
  );
  const user: User = queryResult.rows[0];
  if (user) {
    return user;
  }
  throw new AppError("user not found", 404);
}

export async function getUserByIdDB(id: number): Promise<User> {
  const queryResult = await pool.query(
    "SELECT name,email,id FROM users WHERE id = $1",
    [id],
  );
  const user = queryResult.rows[0];
  if (user) {
    return user;
  }
  throw new AppError("user not found", 404);
}

export async function changeUserNameDB(argId: number, argName: string) {
  const result = await pool.query(
    "UPDATE users SET name = $1 WHERE id = $2 RETURNING *",
    [argName, argId],
  );
  return result.rows[0];
}

export async function getAllUsersDB() {
  const result = await pool.query("SELECT * FROM users");
  return result.rows;
}

export async function addUserDB(name: string, email: string, password: string) {
  const queryResult = await pool.query(
    "INSERT INTO users (name , email , user_password) VALUES ($1 ,$2 , $3) RETURNING *",
    [name, email, password],
  );
  return queryResult.rows[0];
}

export async function deleteUserDB(id: number) {
  const queryResult = await pool.query(
    "DELETE FROM users WHERE id = $1 RETURNING *",
    [id],
  );

  return queryResult.rows[0];
}

export async function getUserPassword(email: string) {
  const queryResult = await pool.query(
    "SELECT user_password FROM users WHERE email = $1",
    [email],
  );
  const userPassword = queryResult.rows[0].user_password;
  if (userPassword) {
    return userPassword;
  }
  throw new AppError("user not found", 404);
}

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
    "UPDATE users SET username = $1 WHERE id = $2 RETURNING *",
    [argName, argId],
  );
  return result.rows[0];
}

export async function getAllUsersDB() {
  const result = await pool.query("SELECT * FROM users");
  return result.rows;
}

export async function addUserDB(
  username: string,
  email: string,
  password: string,
  display_name: string,
  bio: string,
  avatar_url: string,
) {
  const queryResult = await pool.query(
    "INSERT INTO users (username , email , user_password , display_name , bio , avatar_url ) VALUES ($1 ,$2 , $3 , $4 , $5, $6) RETURNING *",
    [username, email, password, display_name, bio, avatar_url],
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

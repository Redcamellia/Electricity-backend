import { Request, Response, NextFunction } from "express";
import AppError from "../Errors/appError";
import pool from "../db";

async function changeUserName(argId: number, argName: string) {
  const result = await pool.query(
    "UPDATE users SET name = $1 WHERE id = $2 RETURNING *",
    [argName, argId],
  );
  if (result.rows[0] == undefined)
    throw new AppError("such user does not exist", 404);
  return result.rows[0];
}

export async function getUsers(req: Request, res: Response) {
  const queryResult = await pool.query("SELECT * FROM users");
  const rows = queryResult.rows;
  res.status(200).json(rows);
}
export async function getUser(req: Request, res: Response) {
  const id = Number(req.params.id);
  console.log(id);
  const queryResult = await pool.query("SELECT * FROM users WHERE id = $1", [
    id,
  ]);
  const user = queryResult.rows[0];

  if (!user) {
    throw new AppError("user not found", 404);

    return;
  }
  res.json(user);
}
export async function addUser(req: Request, res: Response) {
  const queryResult = await pool.query(
    "INSERT INTO users (name , email) VALUES ($1 ,$2) RETURNING *",
    [req.body.name, req.body.email],
  );
  const newUser = queryResult.rows[0];

  res.status(201).json(newUser);
}

export async function modifyUser(req: Request, res: Response) {
  if (req.body.name.trim() === "") {
    throw new AppError("name must be a non empty string", 400);
    return;
  }

  const result = await changeUserName(Number(req.params.id), req.body.name);
  res.status(200).json(result);
}
export async function deleteUser(req: Request, res: Response) {
  const id = Number(req.params.id);
  const queryResult = await pool.query(
    "DELETE FROM users WHERE id = $1 RETURNING *",
    [id],
  );
  if (queryResult.rows[0] == undefined) {
    throw new AppError("user not found", 404);
    return;
  }
  res.status(200).json(queryResult.rows[0]);
  return;
}

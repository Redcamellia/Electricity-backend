import { Request, Response, NextFunction } from "express";
import AppError from "../Errors/appError";
import pool from "../db";
import {
  getUserByIdDB,
  changeUserNameDB,
  getAllUsersDB,
  deleteUserDB,
  addUserDB,
} from "../repositories/users.repository";

export async function getUsers(req: Request, res: Response) {
  const rows = await getAllUsersDB();
  res.status(200).json(rows);
}
export async function getUser(req: Request, res: Response) {
  const id = Number(req.params.id);
  const user = await getUserByIdDB(id);

  if (!user) {
    throw new AppError("user not found", 404);
  }
  res.json(user);
}
export async function addUser(req: Request, res: Response) {
  const newUser = await addUserDB(req.body.name, req.body.email);

  res.status(201).json(newUser);
}

export async function modifyUser(req: Request, res: Response) {
  if (req.body.name.trim() === "") {
    throw new AppError("name must be a non empty string", 400);
    return;
  }

  const result = await changeUserNameDB(Number(req.params.id), req.body.name);
  if (result == undefined) {
    throw new AppError("such user was not found", 404);
  }
  res.status(200).json(result);
}
export async function deleteUser(req: Request, res: Response) {
  const id = Number(req.params.id);
  const deletedUser = await deleteUserDB(id);
  if (deleteUser == undefined) {
    throw new AppError("user not found", 404);
    return;
  }
  res.status(200).json(deletedUser);
  return;
}

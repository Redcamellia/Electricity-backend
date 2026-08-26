import { Request, Response } from "express";
import { hashPassword, comparePassword } from "../services/Auth.service";
import {
  addUserDB,
  getUserByIdDB,
  getUserPassword,
} from "../repositories/users.repository";
import { sign } from "jsonwebtoken";
import AppError from "../Errors/appError";
import { User } from "../types/User";

export async function authLoginController(req: Request, res: Response) {
  const userPassword = await getUserPassword(req.body.id);
  const userObject = await getUserByIdDB(req.body.id);
  console.log(userPassword);
  const isValid = await comparePassword(req.body.password, userPassword);
  if (isValid) {
    const token = sign(userObject, process.env.JWT_SECRET as string);
    res.status(200).json({ token });
    return;
  }
  throw new AppError("wrong credentials", 401);

  //return JWT
}
export async function authSignUpController(req: Request, res: Response) {
  const hashedPassword = await hashPassword(req.body.password);
  console.log(hashedPassword);
  const newUser = await addUserDB(
    req.body.name,
    req.body.email,
    hashedPassword,
  );
  console.log(newUser);
  res.status(201).json(newUser);
}

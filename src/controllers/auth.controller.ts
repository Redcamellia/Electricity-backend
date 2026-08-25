import { Request, Response } from "express";
import { hashPassword, comparePassword } from "../services/Auth.service";
import {
  addUserDB,
  getUserByIdDB,
  getUserPassword,
} from "../repositories/users.repository";

export async function authLoginController(req: Request, res: Response) {
  const userPassword = await getUserPassword(req.body.id);
  console.log(userPassword);
  const isValid = await comparePassword(req.body.password, userPassword);
  console.log(isValid);
  res
    .status(200)
    .json({ message: `user with the id of ${req.body.id} signed in!` });
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

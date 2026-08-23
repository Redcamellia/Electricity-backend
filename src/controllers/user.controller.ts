import { Request, Response, NextFunction } from "express";
import AppError from "../Errors/appError";

type User = {
  id: number;
  name: string;
};
const users: User[] = [
  { id: 1, name: "Alice" },
  { id: 2, name: "Bob" },
];

function changeUserName(argId: number, argName: string) {
  const user = users.find((single) => single.id == argId);
  if (user) {
    user.name = argName;
    return user.id;
  }
  return null;
}

export function getUsers(req: Request, res: Response) {
  res.status(200).json(users);
}
export function getUser(req: Request, res: Response) {
  const id = Number(req.params.id);

  const user = users.find((single) => single.id == id);

  if (!user) {
    res.status(404).json({ error: "not found" });
    res.end(JSON.stringify({ error: "user not found" }));
    return;
  }
  res.json(user);
}
export function addUser(req: Request, res: Response) {
  const newUser = {
    id: users.length + 1,
    name: req.body.name,
  };

  users.push(newUser);

  res.status(201).json(newUser);
}

export function modifyUser(req: Request, res: Response) {
  if (req.body.name.trim() === "") {
    console.log(req.body.name.trim());
    res.status(400).json({ error: "name must be a non empty string" });
    return;
  }

  const result = changeUserName(Number(req.params.id), req.body.name);
  if (result) {
    res.status(200).json(result);
    return;
  }
  throw new AppError("user not found", 404);
}
export function deleteUser(req: Request, res: Response) {
  const id = Number(req.params.id);
  const user = users.find((single) => single.id == id);
  if (user) {
    users.splice(users.indexOf(user), 1);
    res.status(200).json({ msg: "user deleted successfully" });
    console.log(users);
    return;
  }
  res.status(404).json({ error: "user not found" });
  return;
}

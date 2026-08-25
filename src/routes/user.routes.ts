import { Router } from "express";
import {
  deleteUser,
  getUser,
  getUsers,
  modifyUser,
} from "../controllers/user.controller";
import { validateUser } from "../middlewares/validateUser";

export const userRouter = Router();

userRouter.get("/", getUsers);
userRouter.get("/:id", getUser);
userRouter.patch("/:id", validateUser, modifyUser);
userRouter.delete("/:id", deleteUser);

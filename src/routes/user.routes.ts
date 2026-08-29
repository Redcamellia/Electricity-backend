import { Router } from "express";
import {
  deleteUser,
  getUser,
  getUsers,
  modifyUser,
} from "../controllers/user.controller";
import { validateUser } from "../middlewares/validateUser";
import { tokenAuthCheck } from "../middlewares/tokenAuthCheck";

export const userRouter = Router();

userRouter.get("/", tokenAuthCheck, getUsers);
userRouter.get("/:id", tokenAuthCheck, getUser);
userRouter.patch("/:id", validateUser, modifyUser);
userRouter.delete("/:id", deleteUser);

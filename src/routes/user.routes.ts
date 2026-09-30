import { Router } from "express";
import {
  deleteUser,
  getUser,
  getUsers,
  modifyUser,
} from "../controllers/user.controller";
import { validateUser } from "../middlewares/validateUser";
import { tokenAuthCheck } from "../middlewares/tokenAuthCheck";
import { getPostsByUserController } from "../controllers/post.controller";

export const userRouter = Router();

userRouter.get("/", tokenAuthCheck, getUsers);
userRouter.get("/:id/posts", getPostsByUserController);

userRouter.get("/:id", tokenAuthCheck, getUser);
userRouter.patch("/:id", validateUser, modifyUser);
userRouter.delete("/:id", deleteUser);

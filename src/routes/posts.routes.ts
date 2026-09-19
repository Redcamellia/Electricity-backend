import { Router } from "express";
import {
  createPostController,
  getPostsByUserController,
  getPostsController,
  getPostsByEmailController,
  deletePostController,
} from "../controllers/post.controller";
import { tokenAuthCheck } from "../middlewares/tokenAuthCheck";

export const postsRouter = Router();

postsRouter.get("/by-email", getPostsByEmailController);
postsRouter.get("/:id", getPostsByUserController);
postsRouter.get("/", getPostsController);
postsRouter.delete("/:id", tokenAuthCheck, deletePostController);
postsRouter.post("/", tokenAuthCheck, createPostController);

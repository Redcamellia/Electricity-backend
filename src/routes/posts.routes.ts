import { Router } from "express";
import {
  createPostController,
  getPostsByUserController,
  getPostsController,
} from "../controllers/post.controller";

export const postsRouter = Router();

postsRouter.get("/", getPostsController);
postsRouter.get("/:id", getPostsByUserController);
postsRouter.post("/", createPostController);

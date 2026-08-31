import { Router } from "express";
import {
  createPostController,
  getPostsByUserController,
  getPostsController,
  getPostsByEmailController,
} from "../controllers/post.controller";
import { tokenAuthCheck } from "../middlewares/tokenAuthCheck";

export const postsRouter = Router();

postsRouter.get("/by-email", getPostsByEmailController);
postsRouter.get("/:id", getPostsByUserController);
postsRouter.get("/", getPostsController);
postsRouter.post("/", tokenAuthCheck, createPostController);

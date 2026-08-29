import { Router } from "express";
import { getPostsController } from "../controllers/post.controller";

export const postsRouter = Router();

postsRouter.get("/", getPostsController);

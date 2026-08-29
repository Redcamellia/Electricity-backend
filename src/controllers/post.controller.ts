import { Request, Response } from "express";
import { getAllPosts } from "../repositories/posts.repository";

import AppError from "../Errors/appError";
import { User } from "../types/User";

export async function getPostsController(req: Request, res: Response) {
  const results = await getAllPosts();
  res.status(200).json(results);
}

import { application, Request, Response } from "express";
import {
  createPost,
  getAllPosts,
  getAllPostsByUser,
} from "../repositories/posts.repository";

import AppError from "../Errors/appError";
import { User } from "../types/User";
import { getUserByEmail } from "../repositories/users.repository";
import { Post } from "../types/Post";

export async function getPostsController(req: Request, res: Response) {
  const results = await getAllPosts();
  res.status(200).json(results);
}

export async function getPostsByUserController(req: Request, res: Response) {
  const id = req.params.id;
  const results = await getAllPostsByUser(id as string);
  res.status(200).json(results);
}
export async function createPostController(req: Request, res: Response) {
  const user = await getUserByEmail(req.headers.email as string);
  const id = user.id;
  const title = req.body.title;
  const content = req.body.content;
  const post: Post = { userId: id, title: title, content: content };
  const result = await createPost(post);

  if (result == 0) {
    throw new AppError("could not create the post", 401);
  }

  res.status(201).json(post);
}

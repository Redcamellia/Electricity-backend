import { application, Request, Response } from "express";
import {
  createPost,
  getAllPosts,
  getAllPostsByUser,
} from "../repositories/posts.repository";

import AppError from "../Errors/appError";
import { User } from "../types/User";
import {
  getUserByEmail,
  getUserByIdDB,
} from "../repositories/users.repository";
import { Post } from "../types/Post";

export async function getPostsController(req: Request, res: Response) {
  console.log("i am returning all the posts");
  const results = await getAllPosts();
  res.status(200).json(results);
}

export async function getPostsByUserController(req: Request, res: Response) {
  const id = req.query.id;
  const results = await getAllPostsByUser(parseInt(id as string));
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
export async function getPostsByEmailController(req: Request, res: Response) {
  console.log("i am in this controller");
  const user = await getUserByEmail(req.query.email as string);
  console.log(user.id);
  if (user.id) {
    const id = user.id;
    const results = await getAllPostsByUser(id);
    res.status(200).json(results);
    return;
  }
  throw new AppError("user not found", 404);
}

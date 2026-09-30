import { application, Request, Response } from "express";
import {
  createPost,
  deletePost,
  getAllPosts,
  getAllPostsByUser,
  getPostOwner,
} from "../repositories/posts.repository";

import AppError from "../Errors/appError";
import { User } from "../types/User";
import {
  getUserByEmail,
  getUserByIdDB,
} from "../repositories/users.repository";
import { Post } from "../types/Post";

export async function getPostsController(req: Request, res: Response) {
  const results = await getAllPosts();
  res.status(200).json(results);
}

export async function getPostsByUserController(req: Request, res: Response) {
  const id = req.params.id;
  const results = await getAllPostsByUser(parseInt(id as string));
  res.status(200).json(results);
}
export async function createPostController(req: Request, res: Response) {
  console.log(req.body);
  console.log("CONTROLLER USER:", req.user);
  const user = req.user;
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

//deprecated, DO NOT use
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

export async function deletePostController(req: Request, res: Response) {
  const post_id = Number(req.params.id);
  console.log("post id is : " + post_id);
  if (Number.isNaN(post_id)) {
    throw new AppError("post id must be a string", 400);
  }

  const postOwnerPromise = await getPostOwner(Number(post_id));
  if (postOwnerPromise == undefined) {
    throw new AppError("post not found", 404);
  }
  const postOwner = postOwnerPromise.user_id;
  console.log("post owner is : " + postOwner);
  if (postOwner != req.user.id) {
    throw new AppError("user unauthorized to delete this post", 403);
  }
  const result = await deletePost(post_id);
  console.log(result);
  res.status(200).json(result);
}

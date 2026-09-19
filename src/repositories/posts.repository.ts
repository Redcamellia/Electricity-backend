import pool from "../db";
import AppError from "../Errors/appError";
import { Post } from "../types/Post";

export async function getAllPosts() {
  const result = await pool.query("SELECT * FROM posts;");
  return result.rows;
}
export async function getPostOwner(post_id: number) {
  const result = await pool.query(
    "SELECT user_id FROM posts WHERE posts.id = $1;",
    [post_id],
  );
  return result.rows[0].user_id;
}
export async function getAllPostsByUser(id: number) {
  const result = await pool.query(
    "SELECT posts.id,posts.title, posts.content , users.name FROM posts JOIN users ON posts.user_id = users.id WHERE users.id = $1;",
    [id],
  );
  return result.rows;
}

export async function createPost(post: Post) {
  const title = post.title;
  const content = post.content;
  const id = post.userId;

  const insertionResult = await pool.query(
    "INSERT INTO posts (title,content,user_id) VALUES ($1 , $2 , $3)",
    [title, content, id],
  );
  return insertionResult.rowCount;
}
export async function deletePost(post_id: number) {
  const result = await pool.query(
    "DELETE FROM posts WHERE posts.id = $1 RETURNING *;",
    [post_id],
  );
  return result.rows[0];
}

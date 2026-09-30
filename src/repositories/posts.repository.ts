import pool from "../db";
import AppError from "../Errors/appError";
import { Post, PostCreationBlueprint } from "../types/Post";

export async function getAllPosts() {
  const result = await pool.query("SELECT * FROM posts;");
  return result.rows;
}
export async function getPostOwner(post_id: number) {
  const result = await pool.query(
    "SELECT user_id FROM posts WHERE posts.id = $1;",
    [post_id],
  );
  return result.rows[0];
}
export async function getAllPostsByUser(id: number) {
  const result = await pool.query(
    "SELECT posts.id,posts.content, users.display_name , users.username FROM posts JOIN users ON posts.user_id = users.id WHERE users.id = $1;",
    [id],
  );
  return result.rows;
}

export async function createPost(post: PostCreationBlueprint) {
  const content = post.content;
  const author_id = post.author_id;

  const insertionResult = await pool.query(
    "INSERT INTO posts (content,author_id) VALUES ($1 , $2 )",
    [content, author_id],
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

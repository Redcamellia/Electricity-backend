import { Request, Response, NextFunction } from "express";
import AppError from "../Errors/appError";
export function ErrorHandler(
  err: Error,
  req: Request,
  res: Response,
  next: NextFunction,
) {
  console.log(err.stack);
  if (err instanceof AppError) {
    res.status(err.statusCode).json({ error: err.message });
    return;
  }
  res.status(500).json({ error: "internal server error" });
  next(err);
}

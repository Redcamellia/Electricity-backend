import { Request, Response, NextFunction } from "express";

export function ErrorHandler(
  err: Error,
  req: Request,
  res: Response,
  next: NextFunction,
) {
  console.log(err.stack);
  next(err);
}

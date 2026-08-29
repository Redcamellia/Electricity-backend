import { Request, Response, NextFunction } from "express";
import { verify } from "jsonwebtoken";
import { getUserByEmail } from "../repositories/users.repository";
import AppError from "../Errors/appError";

export async function tokenAuthCheck(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const userSentToken = req.headers.authorization;
  const email = req.headers.email;
  const user = await getUserByEmail(email as string);
  const userId = user.id;
  const decoded = verify(
    userSentToken as string,
    process.env.JWT_SECRET as string,
  );
  if (decoded != userId.toString()) {
    throw new AppError("unauthorized", 401);
  } else {
    // console.log("user is authorized");
  }

  next();
}

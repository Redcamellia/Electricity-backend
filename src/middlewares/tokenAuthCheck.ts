import { NextFunction, Request, Response } from "express";
import { verify } from "jsonwebtoken";
import AppError from "../Errors/appError";

export async function tokenAuthCheck(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  try {
    const userSentToken = req.headers.authorization;

    if (!userSentToken) {
      throw new AppError("unauthorized", 401);
    }
    const decoded = verify(userSentToken, process.env.JWT_SECRET as string);

    console.log("DECODED:", decoded);
    console.log("TYPE:", typeof decoded);
    if (typeof decoded === "object" && "userId" in decoded) {
      const userId = decoded.userId;

      console.log(userId);
      req.user = {
        id: userId,
      };
    }
  } catch (error) {
    throw new AppError("unauthorized", 401);
  }

  console.log("MIDDLEWARE USER:", req.user);
  next();
}

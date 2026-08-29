import { Request, Response, NextFunction } from "express";
import { verify } from "jsonwebtoken";
import { getUserByEmail } from "../repositories/users.repository";

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
    console.log("login failed 401");
    console.log(decoded + " = decoded");
    console.log(userId + " = userID");
  } else {
    console.log("user is authorized");
  }

  next();
}

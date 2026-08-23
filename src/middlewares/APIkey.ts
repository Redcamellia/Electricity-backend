import { Request, Response, NextFunction } from "express";

export function apiKey(req: Request, res: Response, next: NextFunction) {
  const key = req.header("express-api-key");

  if (key !== "ehsan") {
    res.status(401).json({ error: "invalid API key" });
    console.log(key);
    return;
  }
  next();
}

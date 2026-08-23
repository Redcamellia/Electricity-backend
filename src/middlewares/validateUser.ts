import { Request, Response, NextFunction } from "express";

export function validateUser(req: Request, res: Response, next: NextFunction) {
  const id = Number(req.params.id);
  const name = req.body.name;
  if (Number.isNaN(id)) {
    res.status(400).json({ error: "id should only be a number" });
    return;
  }
  if (name.trim() === "" || typeof name != "string") {
    res
      .status(400)
      .json({ error: "the name should always be a non empty string" });
  }

  next();
}

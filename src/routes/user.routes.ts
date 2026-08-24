import { Express, Router } from "express";
import {
  getUser,
  getUsers,
  addUser,
  modifyUser,
  deleteUser,
} from "../controllers/user.controller";
import { validateUser } from "../middlewares/validateUser";

export const router = Router();

router.get("/", getUsers);
router.get("/:id", getUser);
router.post("/", addUser);
router.patch("/:id", validateUser, modifyUser);
router.delete("/:id", deleteUser);

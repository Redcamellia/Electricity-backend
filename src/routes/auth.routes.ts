import { Router } from "express";
import {
  authLoginController,
  authSignUpController,
} from "../controllers/auth.controller";

export const authRouter = Router();

authRouter.post("/login", authLoginController);
authRouter.post("/signup", authSignUpController);

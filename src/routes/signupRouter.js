import { Router } from "express";
import { createUser } from "../controllers/signupController.js";

const signupRouter = Router();

signupRouter.post("/signup", createUser);

export default signupRouter;
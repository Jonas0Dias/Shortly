import { Router } from "express";
import { Login } from "../controllers/signinController.js";

const signinRouter = Router();

signinRouter.post("/signin", Login);

export default signinRouter;
import { Router } from "express";
import { userCount } from "../controllers/usersControllers.js";

const usersRouter = Router();

usersRouter.get("/users/me", userCount);


export default usersRouter;
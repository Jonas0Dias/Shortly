import { Router } from "express";
import { userCount } from "../controllers/usersControllers.js";
import { validateToken } from "../middlewares/tokenMiddleWare.js";

const usersRouter = Router();

usersRouter.get("/users/me", validateToken,userCount);


export default usersRouter;
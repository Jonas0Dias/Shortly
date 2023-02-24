import { Router } from "express";
import { visitCount } from "../controllers/rankingController.js";

const rankingRouter = Router();

rankingRouter.get("/ranking", visitCount);

export default rankingRouter;
import { Router } from "express";
import { postShortUrl, getShortUrl, goToShortUrl, deleteShortUrl } from "../controllers/urlsControllers.js";

const urlsRouter = Router();

urlsRouter.post("/urls/shorten", postShortUrl);
urlsRouter.get("/urls/:id", getShortUrl);
urlsRouter.get("/urls/open/shortUrl", goToShortUrl);
urlsRouter.delete("/urls/:id", deleteShortUrl);

export default urlsRouter;
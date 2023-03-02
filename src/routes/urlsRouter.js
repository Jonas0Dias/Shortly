import { Router } from "express";
import { postShortUrl, getShortUrl, goToShortUrl, deleteShortUrl } from "../controllers/urlsControllers.js";
import { urlSchema } from "../schemas/urlSchema.js";
import { schemaValidate } from "../middlewares/schemaMiddleware.js";
import { validateToken } from "../middlewares/tokenMiddleWare.js";

const urlsRouter = Router();

urlsRouter.post("/urls/shorten",schemaValidate(urlSchema), validateToken, postShortUrl);
urlsRouter.get("/urls/:id", getShortUrl);
urlsRouter.get("/urls/open/:shortUrl", goToShortUrl);
urlsRouter.delete("/urls/:id", validateToken, deleteShortUrl);

export default urlsRouter;
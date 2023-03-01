//* Libraries
import express from "express"
import cors from "cors"

//* Routers
import rankingRouter from "./routes/rankingRouter.js"
import signupRouter from "./routes/signupRouter.js"
import signinRouter from "./routes/signinRouter.js"
import urlsRouter from "./routes/urlsRouter.js"
import usersRouter from "./routes/usersRouter.js"


const app = express()

app.use(cors());
app.use(express.json());

app.use([rankingRouter, signinRouter, signupRouter, urlsRouter, usersRouter]);

app.listen(process.env.PORT, () => console.log(`Server Initialized. Port: ${process.env.PORT} `))
import express from "express";

import { router } from "./routes/user.routes";
import { logger } from "./middlewares/Logger";
import { apiKey } from "./middlewares/APIkey";

const app = express();
app.use(express.json());
app.use(logger);
app.use("/users", router);
app.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});

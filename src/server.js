const express = require("express");
const userRoutes = require("./routes/user.routes");
const logger = require("./middlewares/Logger");
const apiKey = require("./middlewares/APIkey");

const app = express();
app.use(express.json());
app.use(logger);
app.use("/users", apiKey, userRoutes);
app.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});

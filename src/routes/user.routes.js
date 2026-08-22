const express = require("express");
const controller = require("../controllers/user.controller");
const router = express.Router();

router.get("/", controller.getUsers);
router.get("/:id", controller.getUser);
router.post("/", controller.addUser);
router.patch("/:id", controller.changeUserName);
module.exports = router;

const express = require("express");
const controller = require("../controllers/user.controller");
const validateUser = require("../middlewares/validateUser");
const router = express.Router();

router.get("/", controller.getUsers);
router.get("/:id", controller.getUser);
router.post("/", validateUser, controller.addUser);
router.patch("/:id", validateUser, controller.modifyUser);
router.delete("/:id", controller.deleteUser);
module.exports = router;

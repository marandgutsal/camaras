const express = require("express");
const router = express.Router();

const alquilerController = require("../controllers/alquilerController");

router.get("/", alquilerController.list);
router.post("/add", alquilerController.save);
router.post("/delete/:id", alquilerController.delete);

router.get("/update/:id", alquilerController.edit);
//router.post("/update/:id", alquilerController.update);

module.exports = router;

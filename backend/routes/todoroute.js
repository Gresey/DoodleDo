const express=require("express");
const router=express.Router();
const todocontroller=require("../controllers/todocontroller");
const Todoservices = require("../services/todoservice");

router.post("/storetodo",todocontroller.createTodotask);
router.post("/gettodotask",todocontroller.getToDoTask);
router.post("/deletetask/:id",todocontroller.deleteToDoTask);

 module.exports=router;
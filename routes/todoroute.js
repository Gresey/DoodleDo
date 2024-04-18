const express=require("express");
const router=express.Router();
const todocontroller=require("../controllers/todocontroller");

router.post("/storetodo",todocontroller.createTodotask);
 module.exports=router;
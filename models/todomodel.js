const mongoose=require("mongoose");
const db=require("../config.js/db");
const userModel=require("../models/user");
const {Schema}=mongoose;

const todoSchema=new Schema({
    userid:{
        type:Schema.Types.ObjectId,
        ref:userModel.modelName
    },
    title:{
        type:String,
        required:true,
    },
    desc:{
        type:String,
        required:true,
    }
});

const TODOModel=mongoose.model('todo',todoSchema);
module.exports=TODOModel;
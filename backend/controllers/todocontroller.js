const Todoservices=require("../services/todoservice");

exports.createTodotask=async (req,res,next)=>{
    try{
    const {title,desc}=req.body;
    const result=await Todoservices.createTodo(title,desc);
    res.json({
        "status":true,
        "message":"created todotask"
    });
    }catch(error){
         console.error("Error in creating todotask",error);
         res.status(500).json({
            "message":"error in creating todotask",
         });
}
}
exports.getToDoTask=async (req,res,next)=>{

    try{
        const {}=req.body;
        const todo=await Todoservices.gettodotask();
        res.json({
            "status":true,
            "message":"created todotask",
            "data" :todo
        });
    }catch(error){
        next(error);
    }
}
exports.deleteToDoTask=async (req,res)=>{
    try{
        
        const deletetask=await Todoservices.deleteToDoTask(req.params.id);
        res.json({
            "status":true,
            "message":"task delete successfully"
        });
    }catch(error){
        console.error("Error in deleting the task");
        res.status(500).json({
            "status":false,
            "message":error.message
        });
    }
}

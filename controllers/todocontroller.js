const Todoservices=require("../services/todoservice");

exports.createTodotask=async (req,res,next)=>{
    try{
    const {userid,title,desc}=req.body;
    const result=await Todoservices.createTodo(userid,title,desc);
    res.status(200).json({
        
        "message":"created todotask"
    });
    }catch(error){
         console.error("Error in creating todotask",error);
         res.status(500).json({
            "message":"error in creating todotask",
         });
}
}

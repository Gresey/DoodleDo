
const todomodel =require("../models/todomodel");

class Todoservices{
    static async createTodo(title,desc){
       try{
        const createtodo=new todomodel({title,desc});
        return await createtodo.save();
       }catch(error){
         throw error;
       }
    }
    static async gettodotask(){
      try{
        const gettodo=await todomodel.find({});
        return gettodo;
        res.json({status:true,success:todo});
      }catch(error){
        throw error;
      }
    }
    static async deleteToDoTask(id){
      try{
        const result=await todomodel.findByIdAndDelete(id);
        
        if(!result){
          throw new Error("No task of the id present");
        }else{
          return result;
        }
       
      }catch(error){
        throw error;
      }
    }
}
module.exports=Todoservices;
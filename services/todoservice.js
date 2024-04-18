const todomodel =require("../models/todomodel");

class Todoservices{
    static async createTodo(userid,title,desc){
       try{
        const createtodo=new todomodel({userid,title,desc});
        return await createtodo.save();
       }catch(error){
         throw error;
       }
    }
}
module.exports=Todoservices;
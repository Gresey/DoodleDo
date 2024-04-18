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
}
module.exports=Todoservices;
const usermodel=require("../models/user");
const jwt=require("jsonwebtoken");
class userService{

    static async registerUser(email,password){
        try{
             const createUser=new usermodel({
                email,password
             });
             return await createUser.save();
        }catch(err){
         throw err;
        }
    }
    static async checkUser(email){
        try{
             return await usermodel.findOne({email});
        }catch(err){
         throw err;
        }
    }
    static async generatetoken(tokenData,secretKey,jwt_expire){
        return jwt.sign(tokenData,secretKey,{expiresIn:jwt_expire});
    }
}
module.exports=userService;
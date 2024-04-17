const mongoose = require("mongoose");
const bcyrpt=require("bcrypt");
const Schema = mongoose.Schema;

const userSchema = new Schema({
    email: {
        type: String,
        lowercase: true,
        unique: true,
        required: true,
    },
    password: {
        type: String,
        required: true,
    }
});
userSchema.pre('save',async function(){
    try{
       var user=this;
       const salt=await(bcyrpt.genSalt(10));
       const hashpass=await bcyrpt.hash(user.password,salt);
       user.password=hashpass;
    }catch(error){
       throw error;
    }
})

const User = mongoose.model("User", userSchema);
module.exports = User;

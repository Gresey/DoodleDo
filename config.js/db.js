const mongoose=require("mongoose");

async function connection(uri){
    try{
        await mongoose.connect(uri);
        console.log("MongoDb connected");
    }catch(error){
        console.error("Error occurred"+error.message);
    }
}

module.exports=connection;
const express=require("express");
const app=express();
const mongoconnect=require("./config.js/db");
const user=require("./models/user");
const TODOModel=require("./models/todomodel");
const bodyparser=require("body-parser");
const userRoute=require("./routes/userroutes");
const path=require("path");
const todoroute=require("./routes/todoroute");

app.use(express.static(path.join(__dirname,'views')));


app.use(bodyparser.json());
app.use(bodyparser.urlencoded({ extended: true }));
const uri="mongodb://localhost:27017/user";
mongoconnect(uri);


app.use('/',userRoute);

app.use('/',todoroute);
app.listen(3000,(req,res)=>{
 console.log("Connected to 3000 port");
});
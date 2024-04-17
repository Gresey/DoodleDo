import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatelessWidget{
   LoginPage({super.key});

  var emailText=TextEditingController();

  var password=TextEditingController();

  bool _isNotValidate=false;

  void registerUser() async{
    if(emailText.text.isNotEmpty && password.text.isNotEmpty){
      var reqBody={
        "email":emailText.text,
        "password":password.text,
      };
      var response=await http.post(Uri.parse("http://10.0.2.2:3000/registration"),
      headers: {"Content-Type":"application/json"},
      body:jsonEncode(reqBody));
      print(response);
    }else{
      _isNotValidate=true;
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
       body:Card(
        //shadowColor: Colors.grey,
        elevation:5,
         child: Padding(
           padding: const EdgeInsets.all(10.0),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
               const Text("Login",textAlign:TextAlign.left,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
              
                Text("Please Login to continue",textAlign:TextAlign.start,style: TextStyle(color: Colors.grey),),
               SizedBox(height:15),
               SizedBox(
                
                height: 50,
                 child: Material(
                  elevation:5,
                  shadowColor: Colors.grey,
                   child: TextField(
                    
                    keyboardType: TextInputType.emailAddress,
                     controller: emailText,
                     decoration: InputDecoration(
                      hintText: "Enter Email",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                      ),
                     
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                      ), 
                      ),
                      
                      prefixIcon: Icon(Icons.email,color:Colors.grey),
                     ),
                   ),
                 ),
               ),
              const  SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  child: Material(
                    shadowColor: Colors.grey,
                    elevation: 5,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                     controller: password,
                     obscureText: true,
                     
                     decoration: InputDecoration(
                      hintText:"Enter Password",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                      ),
                     
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                      ), 
                      ),
                      
                      prefixIcon: Icon(Icons.lock,color:Colors.grey),
                     ),
                               ),
                  ),
                ),
               const SizedBox(height:30),
               ElevatedButton(onPressed: (){
                      String uEmail=emailText.text.toString();
                      String uPass=password.text.toString();
                        registerUser();
               }, child: const Text("Login",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: Colors.black,
                
               ),),
            ],),
         ),
       )
      );
}
}
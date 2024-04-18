import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/homepage.dart';  // Ensure this is the correct import path
import 'package:frontend/signup.dart';   // Ensure this is the correct import path
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailText = TextEditingController();
  final password = TextEditingController();
  bool _isNotValidate = false; // This should be part of a StatefulWidget if it's meant to trigger UI changes

  void registerUser() async {
    if (emailText.text.isNotEmpty && password.text.isNotEmpty) {
      var reqBody = {
        "email": emailText.text,
        "password": password.text,
      };
      var response = await http.post(
        Uri.parse("http://10.0.2.2:3000/registration"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody)
      );
      print(response);
    } else {
      _isNotValidate = true; // No UI response to this condition
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 160),
          child: Center(           
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                      child: Text(
                        "Please login to continue",
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailText,
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:new  BorderSide(
                              color: Colors.black),
                          ),
                           enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),

                            borderSide:new  BorderSide(
                              color: Colors.black),
                          ),
                          
                          prefixIcon: Icon(Icons.email, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 55,
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:new  BorderSide(
                              color: Colors.black),
                          ),
                           enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),

                            borderSide:new  BorderSide(
                              color: Colors.black),
                          ),
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          registerUser();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Background color
                          foregroundColor: Colors.white, 
                          // Text color
                        ),
                        child: Text("Login",style: TextStyle(fontSize: 15),),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              
            
          ),
        ),
      ),
    );
  }
}

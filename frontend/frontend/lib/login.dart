import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/signup.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var emailText = TextEditingController();

  var password = TextEditingController();

  bool _isNotValidate = false;

  void registerUser() async {
    if (emailText.text.isNotEmpty && password.text.isNotEmpty) {
      var reqBody = {
        "email": emailText.text,
        "password": password.text,
      };
      var response = await http.post(
          Uri.parse("http://10.0.2.2:3000/registration"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));
      print(response);
    } else {
      _isNotValidate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 90, bottom: 50, right: 20, left: 20),
          child: Card(
            color: Colors.white,
            shadowColor: Colors.grey,
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Please Login to continue",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 50,
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        shadowColor: Colors.grey,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailText,
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.email, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: Card(
                        color: Colors.white,
                        shadowColor: Colors.grey,
                        elevation: 3,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.lock, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 57,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            String uEmail = emailText.text.toString();
                            String uPass = password.text.toString();
                            registerUser();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}

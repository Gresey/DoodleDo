import 'package:flutter/material.dart';
import 'package:frontend/login.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var Semail = TextEditingController();
    var Sname = TextEditingController();
    var Spass = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 50, bottom: 30, left: 20, right: 20),
          child: Card(
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign Up",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Create Your Account",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    child: Card(
                      elevation: 3,
                      shadowColor: Colors.grey,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: Sname,
                        decoration: InputDecoration(
                          hintText: "Enter Name",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.person, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    child: Card(
                      elevation: 3,
                      shadowColor: Colors.grey,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: Semail,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
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
                    height: 15,
                  ),
                  SizedBox(
                    height: 50,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 3,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
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
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 3,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        controller: Spass,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 57,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ))
                  ]),
                ],
              ),
            ),
          ),
        ));
  }
}

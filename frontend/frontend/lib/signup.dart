import 'package:flutter/material.dart';
import 'package:frontend/login.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var Semail = TextEditingController();
    var Sname = TextEditingController();
    var Spass = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 160),
            child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const Text(
                        "Sign Up",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                        child: const Text(
                          "Create Your Account",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize:15,color: Colors.grey),
                        ),
                      ),
                      
                      SizedBox(
                        height: 50,
                        
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: Sname,
                            decoration: InputDecoration(
                              hintText: "Enter Name",
                              
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
                              prefixIcon: Icon(Icons.person, color: Colors.black),
                            ),
                          ),
                        
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 50,
                        
                        
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: Semail,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter Email",
                               hintMaxLines: 2,
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
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 50,
                        
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter Password",
                               hintMaxLines: 2,
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
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 50,
                        
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            controller: Spass,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Confirm Password",
                               
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
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                      
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(fontSize:15,color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              alignment: Alignment.center,
                              backgroundColor: Colors.black,
                            ),
                          ),
                        
                      ),
                      SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        const Text("Already have an account?"),
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
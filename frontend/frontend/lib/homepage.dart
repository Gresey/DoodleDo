import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  final token;

  const HomePage({@required this.token,Key? key}):super(key:key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String email;
   var titlecontroller=TextEditingController();
   var desccontroller=TextEditingController();
   @override
   void initState(){
    super.initState();
   // Map<String,dynamic> jwtDecodedToken=JwtDecoder.decode(widget.token);
   // email=jwtDecodedToken['email'];
   }
   @override
  void dispose() {
    titlecontroller.dispose();
    desccontroller.dispose();
    super.dispose();
  }
  void ToDo() async{
    if(titlecontroller.text.isNotEmpty && desccontroller.text.isNotEmpty){
      var reqBody={
        "title":titlecontroller.text,
        "desc":desccontroller.text,
      };
      var response=await http.post(Uri.parse("http://10.0.2.2:3000/storetodo"),
      headers: {"Content-Type":"application/json"},
      body:jsonEncode(reqBody));
      print(response);
    }
  }
  @override
  Widget build(BuildContext context) {
    
     void displaydailogbox(){
      showDialog(context: context, 
          builder: (BuildContext context)=> AlertDialog(
            title: Text("Add Task"),
            elevation: 3, 
            content:SingleChildScrollView(
              
              child: ListBody( 
                children: [
                      TextField(
                        controller:titlecontroller,
                        decoration: const InputDecoration(
                        hintText: "Enter Task Name",
                        
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        controller:desccontroller,
                        decoration: const InputDecoration(
                        hintText: "Enter Task ",
                        
                        ),
                      ),
                      
                ],),
            ),
              actions: [
                  ElevatedButton(onPressed: (){
                    ToDo();
                    Navigator.of(context).pop();
                  }, child: Text("Create")),
                  
              ],
          ));
    
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("DoodleDo"),
      ),
      body:Center(child: Text("Click the button to add task"),),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Task',
        backgroundColor: Colors.black,
        child: Icon(Icons.add,color: Colors.white,),
        onPressed:(){
          displaydailogbox();
       } 
        ,),
    );
  }
}
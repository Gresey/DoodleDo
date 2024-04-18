import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_slidable/flutter_slidable.dart';
class HomePage extends StatefulWidget{
  

  const HomePage({Key? key}):super(key:key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String email;
   var titlecontroller=TextEditingController();
   var desccontroller=TextEditingController();
   List? items;

   @override
   void initState(){
    super.initState();
    getTodolist();
   }
   @override
  void dispose() {
    titlecontroller.dispose();
    desccontroller.dispose();
    super.dispose();
  }
  Future<void> ToDo() async{
    if(titlecontroller.text.isNotEmpty && desccontroller.text.isNotEmpty){
      var reqBody={
        "title":titlecontroller.text,
        "desc":desccontroller.text,
      };
      var response=await http.post(Uri.parse("http://10.0.2.2:3000/storetodo"),
      headers: {"Content-Type":"application/json"},
      body:jsonEncode(reqBody));
      var jsonResponse=jsonDecode(response.body);
      if(jsonResponse['status']){
        titlecontroller.clear();
        desccontroller.clear();
        getTodolist();
      }
      print(response);
    }
  }
  Future<void> getTodolist() async {
    var response=await http.post(Uri.parse("http://10.0.2.2:3000/gettodotask"),
    headers: {"Content-Type":"application/json"},
    );
    var jsonResponse=jsonDecode(response.body);
   if (jsonResponse != null && jsonResponse['status'] == true) {
    items = jsonResponse['data']; 
    setState(() {});
  }
  }
  Future<void> deleteTask(String id) async{
    var response=await http.post(Uri.parse("http://10.0.2.2:3000/deletetask/$id"),
    headers:{"Content-Type":"application/json"});
    var jsonResponse=jsonDecode(response.body);
    if(jsonResponse['success']){
      setState(() {
        items=items!.where((item) => item['_id']!=id).toList();
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    
     void displaydailogbox(){
      showDialog(context: context, 
          builder: (BuildContext context)=> AlertDialog(
            title: const Text("Add Task"),
            elevation: 3, 
            content:SingleChildScrollView(
              
              child: Card(
                child: ListBody( 
                  children: [
                        TextField(
                          controller:titlecontroller,
                          decoration: const InputDecoration(
                          hintText: "Enter Task Name",
                          
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextField(
                          controller:desccontroller,
                          decoration: const InputDecoration(
                          hintText: "Enter Task ",
                          
                          ),
                        ),
                        
                  ],),
              ),
            ),
              actions: [
                  ElevatedButton(onPressed: (){
                    ToDo();
                    Navigator.of(context).pop();
                    getTodolist();
                  }, child: const Text("Create")),
                  
              ],
          ));
    
    }
     
     return Scaffold(
      appBar: AppBar(
        title:const Text("DoodleDo"),
      ),
      body:items == null || items!.isEmpty? const Center(child:Text("Add button to add task"),):

      ListView.builder( 
        itemCount: items!.length,
        itemBuilder:(context,index){
          return Slidable(
            key:  ValueKey(items![index]['_id']),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: (){
                deleteTask(items![index]['_id']);
              },),
              children: [
                SlidableAction(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  onPressed: (BuildContext context){
                           deleteTask(items![index]['_id']);
                } 
                ),
              ],),
          
            child:Card(
              color: Colors.white,
              shadowColor: Colors.grey,
              child: ListTile(
              leading:const Icon(Icons.task),
              title:Text(items![index]['title']),
              subtitle: Text(items![index]['desc']),
              trailing: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.arrow_back),),
                        ),
            ),
          );
          
        } ,
      ),
     
     
     
     
     
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Task',
        backgroundColor: Colors.black,
        child: const Icon(Icons.add,color: Colors.white,),
        onPressed:(){
          displaydailogbox();
       } 
        ,),
    );
  }
}
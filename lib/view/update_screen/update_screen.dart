import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do/controller/home_screen_controller.dart';
import 'package:to_do/view/home_screen/home_screen.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => UpdateScreenState();
}

class UpdateScreenState extends State<UpdateScreen> {
  late Database database;
  late Future<List> getTodo;
  late int id;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading:InkWell(
          child: Icon(Icons.arrow_back,),
          onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => HomeScreen(),)
            );
        },),
        centerTitle: true,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text("Add/Update task",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Note Title"
                  ),
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Enter some text";
                    } 
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: null,
                  minLines: 6,
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Write notes here"
                  ),
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Enter some text";
                    } 
                    return null;
                  },
                ),
              ),
              SizedBox(height: 40),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                      //  if (formKey.currentState!.validate()) {
                      //  await HomeScreenController.getTodo(
                        
                      //  );
                      //  } 
                      if (formKey.currentState!.validate()) {
                        await HomeScreenController.addTodo(
                          title: titleController.text, 
                          description: descriptionController.text,
                          );
                      } else {
                        await HomeScreenController.updateTodo( 
                          title: titleController.text, 
                          description: descriptionController.text
                          );
                      }
                      Navigator.pop(context);
                      //  Navigator.push(
                      //   context, 
                      //   MaterialPageRoute(
                      //     builder: (context) => HomeScreen(),
                      //   ),
                      //   );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 55,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.shade400,
                        ),
                        child: Text("Submit",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        titleController.clear();
                        descriptionController.clear();
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 55,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red.shade400,
                        ),
                        child: Text("Clear",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
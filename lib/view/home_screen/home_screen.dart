import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:to_do/view/update_screen/update_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  late Database database;
  late Future<List> getTodo;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: Text("TODO",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.help_outline_rounded,size: 25,),
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateScreen(),
              )
              );
        },
      ),
    );
  }
}
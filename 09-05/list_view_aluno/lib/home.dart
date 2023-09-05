import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          title: Text("Cadastra Aluno"),
          actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/person');
          }, 
          icon: Icon(Icons.table_bar,), color: Colors.blueAccent),
            
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/basket');
          }, 
          icon: Icon(Icons.check), color: Colors.green,),
        ],
        ),
    );
  }
}














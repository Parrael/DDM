import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Sobrenos extends StatelessWidget {
  const Sobrenos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre nós"),
        backgroundColor: Color.fromARGB(255, 90, 29, 139),
         actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: (){
              Navigator.pushNamed(context, '/');
            },
          ),
          IconButton(
            icon: Icon(Icons.plus_one),
            onPressed: (){
              Navigator.pushNamed(context, '/contador');
            },
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: (){
              Navigator.pushNamed(context, '/sobrenos');
            },
          ),
        ],
      ),
      body: Center(
          child: Column(
        children: [
          Text("Sobre nos"),
        ],
      )),
    );
  }
}

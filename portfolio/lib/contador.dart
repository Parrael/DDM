import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/myCont.dart';

class Contador extends StatelessWidget {
  const Contador({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador"),
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
      body: MyCont(),
      bottomNavigationBar: BottomNavigationBar(
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 90, 29, 139)),
            label:"Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.plus_one, color: Color.fromARGB(255, 90, 29, 139)),
            label:"Contador"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Color.fromARGB(255, 90, 29, 139)),
            label:"Sobre nós"
          )
        ],
      ),
    );
  }
}

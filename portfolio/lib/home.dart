import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
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
      /*bottomNavigationBar: BottomNavigationBar(
        onTap: ,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.plus_one)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info)
          ),
        ],
      ),*/
    );
  }
}
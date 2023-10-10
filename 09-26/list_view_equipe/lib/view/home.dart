// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 15,
                child: Text("Equipes:"),
              ),
              DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 112, 17),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/2914/2914275.png')))),

            ],
          )
        ],
      )),
    );
  }
}

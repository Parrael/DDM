// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
  child: Row(
    children: [
      Expanded(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cadastra_equipe');
          },
          child: Text("Equipes"),
        ),
      ),
      Expanded(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cadastra_integrante');
          },
          child: Text("Integrantes"),
        ),
      ),
    ],
  ),
),

    );
  }
}

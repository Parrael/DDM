// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modularizacao/cadastro.dart';
import 'package:modularizacao/exibe_aluno.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List View Aluno',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
      //home: MyCadasto(),
      routes: {
        '/':(context) => MyHome(),
        '/cadastra':(context) => MyCadasto(),
        '/consulta':(context) => MyListaExibe()

      },
    );
  }
}

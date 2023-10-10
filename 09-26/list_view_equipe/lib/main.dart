// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:list_view_equipe/view/cadastra_equipe.dart';
import 'package:list_view_equipe/view/cadastra_integrante.dart';
import 'package:list_view_equipe/view/exibe_equipe.dart';
import 'package:list_view_equipe/view/exibe_integrante.dart';
import 'package:list_view_equipe/view/home.dart';


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
      
      
      routes: {
        '/' : (context) =>MyHome(),
        '/exibeEquipe' : (context) =>MyExibEquipe(),
        '/exibeIntegrante' : (context) =>MyExibIntegrante(),
        '/cadastraEquipe' : (context) =>MyCadastraEquipe(),
        '/cadastraIntegrante' : (context) =>MyCadastraIntegrante(),
      },
      //home: MyHome(),
      );
      }
  }
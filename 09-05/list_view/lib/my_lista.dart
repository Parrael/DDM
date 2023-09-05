// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'aluno.dart';

class MyLista extends StatefulWidget {
  const MyLista({super.key});

  @override
  State<MyLista> createState() => _MyListaState();
}

class _MyListaState extends State<MyLista> {

  List<Aluno> listaA= [];

  @override
  Widget build(BuildContext context) {

    listaA=[];
    listaA.add(Aluno(123, "Tânia"));
    listaA.add(Aluno(345, "Menezes"));
    listaA.add(Aluno(567, "Catarina"));
    listaA.add(Aluno(789, "Mello"));

    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo List View"),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(thickness: 1,),
        itemCount: listaA.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(listaA[index].nome),
            subtitle: Text(listaA[index].ra.toString()),
            leading: Icon(Icons.person_3),
            trailing: Icon(Icons.bubble_chart),
          );
          },
      ),
    );
  }
}

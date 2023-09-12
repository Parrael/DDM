// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modularizacao/aluno_repository.dart';

import 'aluno.dart';

class MyCadasto extends StatefulWidget {
  const MyCadasto({super.key});

  @override
  State<MyCadasto> createState() => _MyCadastoState();
}

class _MyCadastoState extends State<MyCadasto> {
  int ra = 0;
  String nome = " ";
  TextEditingController campoRa = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  AlunoRepository listaAl = AlunoRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 121, 16, 139),
          titleTextStyle: TextStyle(color: Colors.white),
          title: Text("Cadastra Aluno"),
          actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/exibeAluno');
            },
            icon: Icon(Icons.tab,color: Colors.white,),
          )
        ]),
        body: Center(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: campoNome,
                    decoration: InputDecoration(labelText: "Nome:"),
                  ),
                  TextField(
                    controller: campoRa,
                    decoration: InputDecoration(labelText: "RA:"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ra = int.parse(campoRa.text);
                      nome = campoNome.text;
                      Aluno al = Aluno(nome, ra);
                      listaAl.adicionar(al);
                      listaAl.imprimir();
                      campoNome.clear();
                      campoRa.clear();
                    },
                    child: Text("Cadastrar"),
                  )
                ],
              )),
        ));
  }
}

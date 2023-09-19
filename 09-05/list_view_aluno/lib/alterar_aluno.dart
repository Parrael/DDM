// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'aluno.dart';
import 'aluno_repository.dart';

class MyAlterar extends StatefulWidget {
  Aluno aluno;
  int indice;
  MyAlterar(this.aluno, this.indice, {super.key});

  @override
  State<MyAlterar> createState() => _MyAlterarState();
}

class _MyAlterarState extends State<MyAlterar> {
  TextEditingController campoRa = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  List listaA = AlunoRepository.getlistaAlunos;

  @override
  Widget build(BuildContext context) {
    inicializa();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 219, 19, 186),
          titleTextStyle: TextStyle(color: Colors.white),
          title: Text("Alterar Aluno"),
        ),
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
                      int ra = int.parse(campoRa.text);
                      String nome = campoNome.text;
                      // ignore: unnecessary_new
                      Aluno a1 = new Aluno(nome, ra);
                      listaA[widget.indice] = a1;
                      showDialog(
                          context: context,
                          builder: (BuildContext) {
                            return AlertDialog(
                              content: Text("Aluno alterado com sucesso."),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                          context, '/exibeAluno');
                                    },
                                    child: Text("OK"))
                              ],
                            );
                          });
                    },
                    child: Text("Alterar"),
                  )
                ],
              )),
        ));
  }

  void inicializa() {
    campoRa.text = widget.aluno.ra.toString();
    campoNome.text = widget.aluno.nome;
  }

  void mostrarMsgSucesso() {
    AlertDialog(
      content: Text("Aluno alterado com sucesso."),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/exibeAluno');
            },
            child: Text("OK"))
      ],
    );
  }
}

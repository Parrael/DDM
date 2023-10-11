// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:list_view_equipe/model/integrante.dart';
import 'package:list_view_equipe/repository/integrante_repositore.dart';

class MyAlteraIntegrante extends StatefulWidget {
  Integrante integrante;
  int indice;
  MyAlteraIntegrante(this.integrante, this.indice, {super.key});

  @override
  State<MyAlteraIntegrante> createState() => _MyAlteraIntegranteState();
}

class _MyAlteraIntegranteState extends State<MyAlteraIntegrante> {
  TextEditingController campoCodEquipe = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoFuncao = TextEditingController();
  TextEditingController campoNumero = TextEditingController();
  TextEditingController campoRg = TextEditingController();
  List listaAltera = IntegranteRepository.getlistaIntegrantes;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    inicializa();
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 219, 19, 186),
            titleTextStyle: TextStyle(color: Colors.white),
            title: Text("Alterar Integrante"),
            actions: [
              IconButton(
                onPressed: () {
                  mostrarMsgConfirmacao();
                },
                icon: Icon(
                  Icons.tab,
                  color: Colors.white,
                ),
              ),
            ]),
        body: Center(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
              key: _formKey, // Chave global do formulário
              child: Column(
                children: [
                  TextFormField(
                    controller: campoNome,
                    decoration: InputDecoration(labelText: "Nome:"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Preencha este campo!';
                      } else if (value.length < 3) {
                        return 'O Nome deve possuir pelo menos 3 dígitos!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: campoRg,
                    decoration: InputDecoration(labelText: "RG:"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Preencha este campo!';
                      } else if (value.length < 3) {
                        return 'O RG deve possuir pelo menos 8 dígitos!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: campoNumero,
                    decoration: InputDecoration(labelText: "Número:"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Preencha este campo!';
                      } else if (int.parse(value) <= 0) {
                        return 'Valor inválido! Deve ser um número inteiro positivo!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: campoFuncao,
                    decoration: InputDecoration(labelText: "Função:"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Preencha este campo!';
                      } else if (value.length < 3) {
                        return 'A Função deve possuir pelo menos 8 dígitos!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: campoCodEquipe,
                    decoration: InputDecoration(labelText: "Código da Equipe:"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Preencha este campo!';
                      } else if (int.parse(value) <= 0) {
                        return 'Valor inválido! Deve ser um número inteiro positivo!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')));
                      int codEquipe = int.parse(campoCodEquipe.text);
                      String nome = campoNome.text;
                      String funcao = campoFuncao.text;
                      int numero = int.parse(campoNumero.text);
                      String rg = campoRg.text;
                      
                      Integrante i =
                          // ignore: unnecessary_new
                          new Integrante(nome, rg, numero, funcao, codEquipe);
                      listaAltera[widget.indice] = i;
                      mostrarMsgSucesso();
                    }},
                    child: Text("Alterar"),
                  )
                ],
              )),
        )));
  }

  void inicializa() {
    campoCodEquipe.text = widget.integrante.codEquipe.toString();
    campoNome.text = widget.integrante.nome;
    campoFuncao.text = widget.integrante.funcao;
    campoRg.text = widget.integrante.rg;
    campoNumero.text = widget.integrante.numero.toString();
  }

  void mostrarMsgConfirmacao() {
    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            content: Text("Sair sem salvar?"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/exibeIntegrante');
                  },
                  child: Text("Sim")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Não"))
            ],
          );
        });
  }

  void mostrarMsgSucesso() {
    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            content: Text("Integrante alterado com sucesso."),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/exibeIntegrante');
                  },
                  child: Text("OK"))
            ],
          );
        });
  }
}

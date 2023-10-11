import 'package:flutter/material.dart';
import 'package:list_view_equipe/model/equipe.dart';

import '../repository/equipe_repository.dart';

class MyCadastraEquipe extends StatefulWidget {
  const MyCadastraEquipe({super.key});

  @override
  State<MyCadastraEquipe> createState() => _MyCadastraEquipeState();
}

class _MyCadastraEquipeState extends State<MyCadastraEquipe> {
  String nome = "";
  int codEquipe = 0;
  String modalidade = "";
  final _formKey = GlobalKey<FormState>();

  TextEditingController campoCodEquipe = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoModalidade = TextEditingController();

  EquipeRepository listaEq = EquipeRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 121, 16, 139),
            titleTextStyle: TextStyle(color: Colors.white),
            title: Text("Cadastra Equipe"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/exibeEquipe');
                },
                icon: Icon(
                  Icons.tab,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
            ]),
        body: Center(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
              key: _formKey,
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
                  TextFormField(
                    controller: campoModalidade,
                    decoration: InputDecoration(labelText: "Modalidade:"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Preencha este campo!';
                      } else if (value.length < 3) {
                        return 'A Modalidade deve possuir pelo menos 3 dígitos!';
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
                        nome = campoNome.text;
                        codEquipe = int.parse(campoCodEquipe.text);
                        modalidade = campoModalidade.text;
                        Equipe e = Equipe(nome, codEquipe, modalidade);
                        listaEq.adicionar(e);
                        listaEq.imprimir();
                        campoNome.clear();
                        campoCodEquipe.clear();
                        campoModalidade.clear();
                        mostrarMsgSucesso();
                      }
                    },
                    child: Text("Cadastrar Equipe"),
                  )
                ],
              )),
        )));
  }

  void mostrarMsgSucesso() {
    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            content: Text("Equipe cadastrada com sucesso."),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cadastraEquipe');
                  },
                  child: Text("OK"))
            ],
          );
        });
  }
}

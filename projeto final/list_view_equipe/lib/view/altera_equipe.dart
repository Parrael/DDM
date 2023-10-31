import 'package:flutter/material.dart';
import 'package:list_view_equipe/model/equipe.dart';
import 'package:list_view_equipe/repository/equipe_repository.dart';

class MyAlteraEquipe extends StatefulWidget {
  Equipe equipe;
  int indice;
  MyAlteraEquipe(this.equipe, this.indice, {super.key});

  @override
  State<MyAlteraEquipe> createState() => _MyAlteraEquipeState();
}

class _MyAlteraEquipeState extends State<MyAlteraEquipe> {
  TextEditingController campoCodEquipe = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoModalidade = TextEditingController();
  List listaAltera = EquipeRepository.getlistaEquipes;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    inicializa();
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 219, 19, 186),
            titleTextStyle: TextStyle(color: Colors.white),
            title: Text("Alterar Equipe"),
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
                      int codEquipe = int.parse(campoCodEquipe.text);
                      String nome = campoNome.text;
                      String modalidade = campoModalidade.text;
                      // ignore: unnecessary_new
                      Equipe e1 = new Equipe(nome, codEquipe, modalidade);
                      listaAltera[widget.indice] = e1;
                      mostrarMsgSucesso();
                    }},
                    child: Text("Alterar"),
                  )
                ],
              )),
        )));
  }

  void inicializa() {
    campoCodEquipe.text = widget.equipe.codEquipe.toString();
    campoNome.text = widget.equipe.nome;
    campoModalidade.text = widget.equipe.modalidade;
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
                    Navigator.pushNamed(context, '/exibeEquipe');
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
            content: Text("Equipe alterada com sucesso."),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/exibeEquipe');
                  },
                  child: Text("OK"))
            ],
          );
        });
  }
}

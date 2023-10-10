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

  @override
  Widget build(BuildContext context) {
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
                    controller: campoModalidade,
                    decoration: InputDecoration(labelText: "Modalidade:"),
                  ),
                  TextField(
                    controller: campoCodEquipe,
                    decoration: InputDecoration(labelText: "Código da Equipe:"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      int codEquipe = int.parse(campoCodEquipe.text);
                      String nome = campoNome.text;
                      String modalidade = campoModalidade.text;
                      // ignore: unnecessary_new
                      Equipe e1 = new Equipe(nome, codEquipe, modalidade);
                      listaAltera[widget.indice] = e1;
                      showDialog(
                          context: context,
                          builder: (BuildContext) {
                            return AlertDialog(
                              content: Text("Equipe alterada com sucesso."),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                          context, '/exibeEquipe');
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
    campoCodEquipe.text = widget.equipe.codEquipe.toString();
    campoNome.text = widget.equipe.nome;
    campoModalidade.text = widget.equipe.modalidade;
  }

  void mostrarMsgSucesso() {
    AlertDialog(
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
  }
}

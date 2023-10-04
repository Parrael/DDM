import 'package:flutter/material.dart';
import 'package:list_view_equipe/model/equipe.dart';

import '../repository/equipe_repository.dart';

class MyCadastraEquipe extends StatefulWidget {
  const MyCadastraEquipe({super.key});

  @override
  State<MyCadastraEquipe> createState() => _MyCadastraEquipeState();
}

class _MyCadastraEquipeState extends State<MyCadastraEquipe> {
  String nome="";
  int codEquipe=0;
  String modalidade="";
  
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
                  Navigator.pushNamed(context, '/cadastraEquipe');
                },
                icon: Icon(
                  Icons.tab,
                  color: Colors.white,
                ),
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
                    controller: campoCodEquipe,
                    decoration: InputDecoration(labelText: "Código da Equipe:"),
                  ),
                  TextField(
                    controller: campoModalidade,
                    decoration: InputDecoration(labelText: "Modalidade:"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      nome = campoNome.text;
                      codEquipe = int.parse(campoCodEquipe.text);
                      modalidade = campoModalidade.text;
                      Equipe e = Equipe(nome, codEquipe, modalidade);
                      listaEq.adicionar(e);
                      listaEq.imprimir();
                      campoNome.clear();
                      campoCodEquipe.clear();
                      campoModalidade.clear();
                    },
                    child: Text("Cadastrar Equipe"),
                  )
                ],
              )),
        ));
  }
}
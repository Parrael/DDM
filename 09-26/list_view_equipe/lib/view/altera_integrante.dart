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
                    controller: campoRg,
                    decoration: InputDecoration(labelText: "RG:"),
                  ),
                  TextField(
                    controller: campoNumero,
                    decoration: InputDecoration(labelText: "Número:"),
                  ),
                  TextField(
                    controller: campoFuncao,
                    decoration: InputDecoration(labelText: "Função:"),
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
                      String funcao = campoFuncao.text;
                      int numero = int.parse(campoNumero.text);
                      String rg = campoRg.text;
                      // ignore: unnecessary_new
                      Integrante i = new Integrante(nome, rg, numero, funcao, codEquipe);
                      listaAltera[widget.indice] = i;
                      showDialog(
                          context: context,
                          builder: (BuildContext) {
                            return AlertDialog(
                              content: Text("Integrante alterado com sucesso."),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                          context, '/exibeIntegrante');
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
        )
    );
  }
  void inicializa() {
    campoCodEquipe.text = widget.integrante.codEquipe.toString();
    campoNome.text = widget.integrante.nome;
    campoFuncao.text = widget.integrante.funcao;
    campoRg.text = widget.integrante.rg;
    campoNumero.text = widget.integrante.numero.toString();
  }

  void mostrarMsgSucesso() {
    AlertDialog(
      content: Text("Integrante alterado com sucesso."),
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
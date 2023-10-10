import 'package:flutter/material.dart';
import 'package:list_view_equipe/model/integrante.dart';
import 'package:list_view_equipe/repository/integrante_repositore.dart';

class MyCadastraIntegrante extends StatefulWidget {
  const MyCadastraIntegrante({super.key});

  @override
  State<MyCadastraIntegrante> createState() => _MyCadastraIntegranteState();
}

class _MyCadastraIntegranteState extends State<MyCadastraIntegrante> {
  String nome="";
  String rg="";
  int numero=0;
  String funcao="";
  int codEquipe=0;

  TextEditingController campoNome = TextEditingController();
  TextEditingController campoRg = TextEditingController();
  TextEditingController campoNumero = TextEditingController();
  TextEditingController campoFuncao = TextEditingController();
  TextEditingController campoCodEquipe = TextEditingController();

  IntegranteRepository listaInt = IntegranteRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 121, 16, 139),
            titleTextStyle: TextStyle(color: Colors.white),
            title: Text("Cadastra Integrante"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastraIntegrante');
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
                      rg = campoRg.text;
                      nome = campoNome.text;
                      numero = int.parse(campoNumero.text);
                      funcao = campoFuncao.text;
                      codEquipe = int.parse(campoCodEquipe.text);
                      
                      Integrante i = Integrante(nome, rg, numero, funcao, codEquipe); 
                      listaInt.adicionar(i);
                      listaInt.imprimir();
                      campoNome.clear();
                      campoRg.clear();
                      campoNumero.clear();
                      campoFuncao.clear();
                      campoCodEquipe.clear();
                    },
                    child: Text("Cadastrar Integrante"),
                  )
                ],
              )),
        ));
  }
}

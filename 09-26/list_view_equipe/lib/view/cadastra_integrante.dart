import 'package:flutter/material.dart';

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

  TextEditingController campoNome = TextEditingController();
  TextEditingController campoRg = TextEditingController();
  TextEditingController campoNumero = TextEditingController();
  TextEditingController campoFuncao = TextEditingController();

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

                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      rg = campoRg.text;
                      nome = campoNome.text;
                      numero = int.parse(campoNumero.text);
                      funcao = campoFuncao.text;
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

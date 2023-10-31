import 'package:flutter/material.dart';
import 'package:list_view_equipe/model/integrante.dart';
import 'package:list_view_equipe/repository/integrante_repositore.dart';

class MyCadastraIntegrante extends StatefulWidget {
  const MyCadastraIntegrante({super.key});

  @override
  State<MyCadastraIntegrante> createState() => _MyCadastraIntegranteState();
}

class _MyCadastraIntegranteState extends State<MyCadastraIntegrante> {
  String nome = "";
  String rg = "";
  int numero = 0;
  String funcao = "";
  int codEquipe = 0;
  final _formKey = GlobalKey<FormState>();

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
                  Navigator.pushNamed(context, '/exibeIntegrante');
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
                  icon: Icon(Icons.home, color: Colors.white))
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
                        rg = campoRg.text;
                        nome = campoNome.text;
                        numero = int.parse(campoNumero.text);
                        funcao = campoFuncao.text;
                        codEquipe = int.parse(campoCodEquipe.text);

                        Integrante i =
                            Integrante(nome, rg, numero, funcao, codEquipe);
                        listaInt.adicionar(i);
                        listaInt.imprimir();
                        campoNome.clear();
                        campoRg.clear();
                        campoNumero.clear();
                        campoFuncao.clear();
                        campoCodEquipe.clear();
                        mostrarMsgSucesso();
                      }
                    },
                    child: Text("Cadastrar Integrante"),
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
            content: Text("Integrante cadastrado com sucesso."),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cadastraIntegrante');
                  },
                  child: Text("OK"))
            ],
          );
        });
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:modularizacao/alterar_aluno.dart';
import 'package:modularizacao/aluno.dart';
import 'package:modularizacao/aluno_repository.dart';

class MyListaExibe extends StatefulWidget {
  const MyListaExibe({super.key});

  @override
  State<MyListaExibe> createState() => _MyListaExibeState();
}

class _MyListaExibeState extends State<MyListaExibe> {
  List listaA = AlunoRepository.getlistaAlunos;
  List listaBusca = [];
  String nomeBusca="";

  @override
  void initState() {
    listaBusca = List.from(listaA);
    super.initState();
  }

  void atualizaLista(String nome) {
    listaBusca = List.from(listaA);
    setState(() {
      listaBusca = listaA
          .where((element) =>
              element.nome.toLowerCase().startsWith(nome.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 90, 11, 218),
            titleTextStyle: TextStyle(color: Colors.white),
            title: Text("Exibe Aluno"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: Icon(
                  Icons.tab,
                  color: Colors.white,
                ),
              )
            ]),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 350,
              height: 30,
              child: TextField(
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.blueAccent,
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (String nome) {
                    nomeBusca = nome;
                    atualizaLista(nomeBusca);
                  }),
            ),
            SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(
                  thickness: 2,
                ),
                itemCount: listaBusca.length,
                itemBuilder: (BuildContext contect, int index) {
                  return ListTile(
                    trailing: SizedBox(
                      width: 70,
                      child: Row(children: [
                        Expanded(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  AlunoRepository().remover(listaA[index]);
                                  atualizaLista(nomeBusca);
                                });
                              },
                              icon: Icon(Icons.delete)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MyAlterar(listaA[index], index);
                                }));
                              },
                              icon: Icon(Icons.edit)),
                        )
                      ]),
                    ),
                    leading: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 238, 92, 92),
                        child: Text(listaBusca[index].nome[0])),
                    title: Text(listaBusca[index].nome),
                    subtitle: Text(listaBusca[index].ra.toString()),
                    /*trailing: IconButton (icon:Icon(Icons.delete_forever_rounded), onPressed: {
                  showDialog(
                    context: context, 
                    builder: (BuildContext)
                    {return AlertDialog(content: Text("Confirmar exclusão?",));});},)*/
                  );
                },
                padding: EdgeInsets.all(7),
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text("Voltar")),
            )
          ]),
        ));
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modularizacao/aluno_repository.dart';



class MyListaExibe extends StatefulWidget {
  const MyListaExibe({super.key});

  @override
  State<MyListaExibe> createState() => _MyListaExibeState();
}

class _MyListaExibeState extends State<MyListaExibe> {
  final List listaA = AlunoRepository.getlistaAlunos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 235, 142, 22),
          titleTextStyle: TextStyle(color: Colors.black),
          title: Text("Exibe Aluno"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: Icon(
                Icons.tab,
                color: Colors.black,
              ),
            )
          ]),

      body: Column(children: [
        SizedBox(
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => Divider(
              thickness: 2,
            ),
            itemCount: listaA.length,
            itemBuilder: (BuildContext contect, int index) {
              return ListTile(
                leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 238, 92, 92),
                    child: Text(listaA[index].nome[0])),
                title: Text(listaA[index].nome),
                subtitle: Text(listaA[index].ra.toString()),
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
        SizedBox(child: ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/');}, child: Text("Voltar")),)
      ]),
    );
  }
}

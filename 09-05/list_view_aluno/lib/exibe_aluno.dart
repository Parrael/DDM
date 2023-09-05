import 'package:flutter/material.dart';

import 'aluno.dart';


class MyListaExibe extends StatefulWidget {
  const MyListaExibe({super.key});

  @override
  State<MyListaExibe> createState() => _MyListaExibeState();
  
}

class _MyListaExibeState extends State<MyListaExibe> {
  List<Aluno> listaA= [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ListView.separated(
          separatorBuilder: (context, index) => Divider(thickness: 2,),
          itemCount: listaA.length,
          itemBuilder: (BuildContext contect, int index) {
            return ListTile(
              leading: Icon(Icons.person_3_sharp),
              title: Text(listaA[index].nome),
              subtitle: Text(listaA[index].ra.toString()),
            );
          },
        )
      ]),
    );
  }
}
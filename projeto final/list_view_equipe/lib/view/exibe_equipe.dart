// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:list_view_equipe/repository/equipe_repository.dart';
import 'package:list_view_equipe/view/altera_equipe.dart';

class MyExibEquipe extends StatefulWidget {
  const MyExibEquipe({super.key});

  @override
  State<MyExibEquipe> createState() => _MyExibEquipeState();
}

class _MyExibEquipeState extends State<MyExibEquipe> {
  List listaEquipes = EquipeRepository.getlistaEquipes;
  List listaBusca = [];
  String nomeBusca = "";

  @override
  void initState() {
    listaBusca = List.from(listaEquipes);
    super.initState();
    atualizaLista(nomeBusca);
  }

  void atualizaLista(String nome) {
    listaBusca = List.from(listaEquipes);
    setState(() {
      listaBusca = listaEquipes
          .where((element) =>
              element.nome.toLowerCase().startsWith(nome.toLowerCase()))
          .toList();
          listaBusca.sort((a, b) => a.compareTo(b)); // Ordena a lista usando a função de comparação personalizada 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 90, 11, 218),
            titleTextStyle: TextStyle(color: Colors.white),
            title: Text("Exibe Equipe"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastraEquipe');
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
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ))
            ]),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: TextField(
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                    filled: false,
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
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MyAlteraEquipe(
                                      listaBusca[index], index);
                                }));
                              },
                              icon: Icon(Icons.edit)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  EquipeRepository().remover(listaBusca[index]);
                                  atualizaLista(nomeBusca);
                                });
                              },
                              icon: Icon(Icons.delete)),
                        ),
                      ]),
                    ),
                    leading: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 238, 92, 92),
                        child: Text(listaBusca[index].nome[0])),
                    title: Text(listaBusca[index].nome),
                    subtitle: Text(listaBusca[index].modalidade),
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
          ]),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:list_view_equipe/repository/integrante_repositore.dart';
import 'package:list_view_equipe/view/altera_integrante.dart';

class MyExibIntegrante extends StatefulWidget {
  const MyExibIntegrante({super.key});

  @override
  State<MyExibIntegrante> createState() => _MyExibIntegranteState();
}

class _MyExibIntegranteState extends State<MyExibIntegrante> {
  List listaIntegrantes = IntegranteRepository.getlistaIntegrantes;
  List listaBusca = [];
  String nomeBusca="";

  @override
  void initState() {
    listaBusca = List.from(listaIntegrantes);
    super.initState();
  }

  void atualizaLista(String nome) {
    listaBusca = List.from(listaIntegrantes);
    setState(() {
      listaBusca = listaIntegrantes
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
            title: Text("Exibe Equipe"),
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
                                  IntegranteRepository().remover(listaIntegrantes[index]);
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
                                  return MyAlteraIntegrante(listaIntegrantes[index], index);
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
                    subtitle: Text(listaBusca[index].funcao),
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
        )
    );
  }
}
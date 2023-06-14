import 'package:flutter/material.dart';

class Cliente extends StatefulWidget {
  const Cliente({super.key});

  @override
  State<Cliente> createState() => _ClienteState();
}

class _ClienteState extends State<Cliente> {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerCpf = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerIdade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(251, 248, 194, 248),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: Icon(Icons.home_filled)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/clientes');
              },
              icon: Icon(Icons.people)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/produto');
              },
              icon: Icon(Icons.shopping_basket_rounded)),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Cadastro de clientes",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: controllerNome,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: controllerCpf,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CPF',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: controllerEmail,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: controllerIdade,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Idade',
              ),
            ),
          )
        ],
      )),
    );
  }
}

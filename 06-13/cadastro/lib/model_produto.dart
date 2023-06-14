import 'package:flutter/material.dart';

class Produto extends StatefulWidget {
  const Produto({super.key});

  @override
  State<Produto> createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerPreco = TextEditingController();
  TextEditingController controllerQuantidade = TextEditingController();
  TextEditingController controllerTipo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          AppBar(
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
        ]),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 60, 6, 146),
        title: Text("Home Screen", style: TextStyle(color: Colors.white)),
      ),
      backgroundColor:  Color.fromARGB(191, 154, 107, 229),
      body: Center( 
        
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centraliza verticalmente
          children: [
            Column(
              children: [
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/6421/6421323.png', // Substitua pela URL da sua imagem
                  width: 200, // Largura da imagem
                  height: 200, // Altura da imagem
                  fit: BoxFit
                      .contain, // Opções: BoxFit.fill, BoxFit.contain, etc.
                ),
                // Substitua pelo caminho da imagem da Equipes
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastraEquipe');
                  },
                  child: Text("Equipes", style: TextStyle(fontSize: 30.0)),
                ),
              ],
            ),
            SizedBox(height: 20), // Adiciona um espaço entre os botões
            Column( //https://static.vecteezy.com/ti/vetor-gratis/p3/2578394-jogo-de-basquete-esportistas-com-bola-recreacao-esporte-silhueta-icone-estilo-gratis-vetor.jpg
              children: [
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/833/833256.png', // Substitua pela URL da sua imagem
                  width: 200, // Largura da imagem
                  height: 200, // Altura da imagem
                  fit: BoxFit
                      .contain, // Opções: BoxFit.fill, BoxFit.contain, etc.
                ), // Substitua pelo caminho da imagem de Integrantes
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastraIntegrante');
                  },
                  child: Text("Integrantes", style: TextStyle(fontSize: 30.0)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

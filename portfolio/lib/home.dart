import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/jogadores.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Color.fromARGB(255, 90, 29, 139),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: (){
              Navigator.pushNamed(context, '/');
            },
          ),
          IconButton(
            icon: Icon(Icons.plus_one),
            onPressed: (){
              Navigator.pushNamed(context, '/contador');
            },
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: (){
              Navigator.pushNamed(context, '/sobrenos');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ), 

            DecoratedBox(
              decoration: BoxDecoration(color: Colors.white24),
              child: Image.network('https://upload.wikimedia.org/wikipedia/pt/2/22/%C3%8DbisSC.png', width: 80),
            ),

            jogadores("Rildo", 'https://pbs.twimg.com/media/E1mJXdLXsAIMVP5?format=jpg&name=small'),
            jogadores("Bodinho", 'https://esportenewsmundo.com.br/wp-content/uploads/2020/07/Bodinho-2.jpg'),
            jogadores("Vavá", 'https://upload.wikimedia.org/wikipedia/pt/1/1d/Vav%C3%A1.jpeg'),
            jogadores("Mauro Shampoo", 'https://e.imguol.com/esporte/futebol/2011/05/24/mauro-shampoo-ex-jogador-tido-como-o-maior-da-historia-do-ibis-1306248246145_300x230.jpg'),
          ],
        ),
      )
      /*bottomNavigationBar: BottomNavigationBar(
        onTap: ,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.plus_one)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info)
          ),
        ],
      ),*/
    );
  }
}
import 'package:flutter/material.dart';
import 'jogadores.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apresentação',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        backgroundColor: Colors.red.shade200,
        appBar: AppBar(
          title: Text("Ibis"),
          centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ), 

            DecoratedBox(
              decoration: BoxDecoration(color: Colors.white24),
              child: Image.network('https://upload.wikimedia.org/wikipedia/pt/2/22/%C3%8DbisSC.png', width: 150),
            ),

            SizedBox(
              height: 60,
            ), 

            jogadores("Rildo", 'https://pbs.twimg.com/media/E1mJXdLXsAIMVP5?format=jpg&name=small'),
            jogadores("Bodinho", 'https://media.internacional.groundsportech.com/wp-content/uploads/2020/01/30210218/Bodinho4.jpg'),
            jogadores("Mauro Shampoo", 'https://e.imguol.com/esporte/futebol/2011/05/24/mauro-shampoo-ex-jogador-tido-como-o-maior-da-historia-do-ibis-1306248246145_300x230.jpg'),
          ],
        ),
      ),
    ),
    );
  }
}

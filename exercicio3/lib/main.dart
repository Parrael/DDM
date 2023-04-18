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
              height: 20,
            ), 

            jogadores(),
          ],
        ),
      ),
    ),
    );
  }
}
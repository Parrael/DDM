import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';

class jogadores extends StatelessWidget {
  const jogadores(this.jogador, {super.key});

  final String jogador; 

  @override
  Widget build(BuildContext context) {
    return Row(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
      decoration: BoxDecoration(color: Colors.white24),
      child: Padding( padding: EdgeInsets.all(10),
      child: Text(jogador, style: TextStyle(fontSize: 14)),    
      Image.network('https://upload.wikimedia.org/wikipedia/pt/2/22/%C3%8DbisSC.png', width: 20),
      )
      )
        ]
    );
  }
}
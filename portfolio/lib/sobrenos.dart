import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Sobrenos extends StatelessWidget {
  const Sobrenos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre nós"),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network("https://media.licdn.com/dms/image/C5603AQFZV6NjnVjymw/profile-displayphoto-shrink_800_800/0/1516851043189?e=2147483647&v=beta&t=LYrJcEx0su8uM0gmXFxmxDPUPPQi3bgtm5FLlcl9GK4"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.phone, color: Color.fromARGB(255, 90, 29, 139)),
              Icon(Icons.message, color: Color.fromARGB(255, 90, 29, 139)),
              Icon(Icons.mail, color: Color.fromARGB(255, 90, 29, 139)),
            ],
          ),
          DecoratedBox(
            decoration: BoxDecoration(
            color: Color.fromARGB(100, 90, 29, 139),
          ),
          child: Text("Possui graduação em Ciência da Computação pela Universidade Metodista de Piracicaba(2000) e especialização em Tecnologia da Informação pela Universidade Metodista de Piracicaba(2004).",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 90, 29, 139),
            ),
          ),)
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 90, 29, 139)),
            label:"Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.plus_one, color: Color.fromARGB(255, 90, 29, 139)),
            label:"Contador"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Color.fromARGB(255, 90, 29, 139)),
            label:"Sobre nós"
          )
        ],
      ),
    );
  }
}

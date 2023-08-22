import 'package:exerc_login/usuario.dart';
import 'package:exerc_login/usuario_repository.dart';
import 'package:flutter/material.dart';



class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  String user = "";
  String senha = "";
  TextEditingController campoUser = TextEditingController();
  TextEditingController campoSenha = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  UsuarioRepository u1 = UsuarioRepository();
  Usuario u2 = Usuario("user", "senha");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Faça seu login"),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                    controller: campoUser,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      labelText: "User:",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("O user não pode ser vazio");
                      } else if (campoUser.text.length < 3) {
                        return ("O user deve possuir no mínimo 3 digitos");
                      }
                      return null;
                    }),
                TextFormField(
                    controller: campoSenha,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      labelText: "Senha:",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("A senha não pode ser vazio");
                      } else if (campoUser.text.length < 5) {
                        return ("A senha deve possuir no mínimo 5 digitos");
                      }
                      return null;
                    }),
                ElevatedButton(
                    onPressed: () {
                      user = campoUser.text;
                      senha = campoSenha.text;
                      Usuario us = Usuario(user, senha);
                      u1.adicionar(us);
                        setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Cadastro bem sucedido!")));
                    },
                    child: Text("Cadastrar")),
                ElevatedButton(
                    onPressed: () {
                      user = campoUser.text;
                      senha = campoSenha.text;
                      Usuario us = Usuario(user, senha);                      
                      if (u1.logar(us)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login bem sucedido!")));
                      }
                      setState(() {});
                    },
                    child: Text("Logar")),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

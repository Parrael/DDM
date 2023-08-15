import 'package:flutter/material.dart';
import 'usuario_repository.dart';

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
  UsuarioRepository U1 = UsuarioRepository();

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
                    controller: campoUser,
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
                      if (formKey.currentState!.validate()) {
                        setState(() {});
                      }
                    },
                    child: Text("Cadastrar")),
                ElevatedButton(
                    onPressed: () {
                      user = campoUser.text;
                      senha = campoSenha.text;
                      setState(() {});
                      if (U1.logar(user, senha)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login bem sucedido!")));
                      }
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

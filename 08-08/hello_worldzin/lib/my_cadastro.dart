import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCadastro extends StatefulWidget {
  const MyCadastro({super.key});
  @override
  State<MyCadastro> createState() => _MyCadastroState();
}

class _MyCadastroState extends State<MyCadastro> {

  int ra=0;
  String nome="";
  TextEditingController campoRa = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(251, 248, 194, 248),
      title: Text("Hello World"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Form(
              key: formKey,
              child: Column( 
                
                children: [
                  TextFormField(
                    controller: campoRa,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(labelText: "Ra:",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    filled: true,),
                    validator: (value){
                      if(value!.isEmpty){
                        return ("O RA não pode ser vazio");
                      } else if(int.parse(campoRa.text)<10){
                        return ("O RA deve ser maior que 10");
                      }
                      return null;
                    }

                  ),
                  TextFormField(
                    controller: campoNome,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(labelText: "Nome:",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    filled: true,),
                    validator: (value){
                      if(value!.isEmpty){
                        return ("O nome não pode ser vazio");
                      } else if(campoNome.text.length<5){
                        return ("O nome deve possuir no mínimo 5 digitos");
                      }
                      return null;
                      
                    }

                  ),
              ]),
            ),
            ElevatedButton(
              onPressed: (){
                if(formKey.currentState!.validate()){
                  ra = int.parse(campoRa.text);
                  nome = campoNome.text;
                  mostrarSnack();
                  setState(() {
                  
                  });
                }
              }, child: Text("Cadastrar")),
              Text("Valores Digitados -$ra e -$nome"),
      ]),)
    );
  }
  void mostrarSnack(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Aluno cadastrado com sucesso!")));
  }
}
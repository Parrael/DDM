import 'aluno.dart';

class AlunoRepository{
  static List<Aluno> _listaAlunos = [];

  static get getlistaAlunos => _listaAlunos;

  set listaAlunos(value) => _listaAlunos = value;
  

  //construtor
   AlunoRepository(){
    _listaAlunos = [];
  }

  void adicionar(Aluno al){
    _listaAlunos.add(al);
  }

  void imprimir(){
    for(var i=0; i<_listaAlunos.length; i++){
      print("RA: ${_listaAlunos[i].ra}, Nome: ${_listaAlunos[i].nome},");
    }
  }
  void remover(Aluno a1){
    _listaAlunos.remove(a1);
  }
}
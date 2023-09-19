import 'aluno.dart';

class AlunoRepository{
  static List<Aluno> _listaAlunos = [
    Aluno("Parra", 201286),
    Aluno("Menezes", 203255),
    Aluno("Catarina", 201171),
    Aluno("Chaba", 201605),
    Aluno("Basso Tânia", 975310),
  ];

  static get getlistaAlunos => _listaAlunos;

  set listaAlunos(value) => _listaAlunos = value;
  

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
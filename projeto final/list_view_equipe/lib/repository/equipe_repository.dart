import '../model/equipe.dart';

class EquipeRepository{
  static List<Equipe> _listaEquipes = [
    Equipe("Inter Miami", 1, "Futebol"),
    Equipe("Furia", 2, "Counter-Strike"),
    Equipe("Bulls", 3, "Basquete"),
    Equipe("CBCa", 4, "Canoagem"),
    Equipe("Cotil", 5, "Vôlei"),
  ];

  static get getlistaEquipes => _listaEquipes;

  set listaEquipes(value) => _listaEquipes = value;
  

  void adicionar(Equipe e){
    _listaEquipes.add(e);
  }

  void imprimir(){
    for(var i=0; i<_listaEquipes.length; i++){
      print("Nome: ${_listaEquipes[i].nome}, Código Equipe: ${_listaEquipes[i].codEquipe}, Modalidade:${_listaEquipes[i].modalidade}");
    }
  }
  void remover(Equipe e){
    _listaEquipes.remove(e);
  }
  
}
import 'package:list_view_equipe/model/integrante.dart';

class IntegranteRepository{
  static List<Integrante> _listaIntegrantes = [
    Integrante("Gilmar", "728632481", 69, "veleiro", 4),
    Integrante("Matheus", "9079084053", 13, "central", 5),
    Integrante("Messi", "3479599005", 10, "meio-armador", 1),
    Integrante("Stephen Curry", "0004320795", 30, "arremessador", 3),
    //furia
    Integrante("arT", "7842015638", 02, "igl", 2),
    Integrante("yuurih", "784023569x", 08, "suporte", 2),
    Integrante("KSCERATO", "9840235612", 22, "rifler", 2),
    Integrante("falleN", "8103597856", 01, "sniper", 2),
    Integrante("Chelo", "2035179635", 07, "fragger", 2),
  ];
  
  static get getlistaIntegrantes => _listaIntegrantes;

  set listaIntegrantes(value) => _listaIntegrantes = value;
  

  void adicionar(Integrante i){
    _listaIntegrantes.add(i);
  }

  void imprimir(){
    for(var i=0; i<_listaIntegrantes.length; i++){
      print("Nome: ${_listaIntegrantes[i].nome}, RG: ${_listaIntegrantes[i].rg}, Número:${_listaIntegrantes[i].numero}, Função:${_listaIntegrantes[i].funcao}, Código Equipe:${_listaIntegrantes[i].codEquipe}");
    }
  }
  void remover(Integrante i){
    _listaIntegrantes.remove(i);
  }
}
class Integrante {
  String nome = "";
  String rg = "";
  int numero = 0;
  String funcao = "";
  int codEquipe = 0;

  //Construtor:
  Integrante(this.nome, this.rg, this.numero, this.funcao, this.codEquipe);

  int compareTo(Integrante other) {
    final nomeLowerCase = nome.toLowerCase();
    final otherNomeLowerCase = other.nome.toLowerCase();
    return nomeLowerCase.compareTo(otherNomeLowerCase);
  }

  //getters e setters
  get getNome => this.nome;

  set setNome(nome) => this.nome = nome;

  get getRg => this.rg;

  set setRg(rg) => this.rg = rg;

  int get getNumero => this.numero;

  set setNumero(int numero) => this.numero = numero;

  get getFuncao => this.funcao;

  set setFuncao(funcao) => this.funcao = funcao;

  int get getCodEquipe => this.codEquipe;

  set setCodEquipe(int codEquipe) => this.codEquipe = codEquipe;
}

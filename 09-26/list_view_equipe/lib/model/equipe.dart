class Equipe{
  String nome="";
  int codEquipe=0;
  String modalidade="";

  //Construtor:
  Equipe(this.nome, this.codEquipe, this.modalidade);

  //getters e setters
  int get getCodEquipe => this.codEquipe;

  set setRa(int codEquipe) => this.codEquipe = codEquipe;

  get getNome => this.nome;

  set setNome( nome) => this.nome = nome;

  get getModalidade => this.modalidade;

  set setModalidade( modalidade) => this.modalidade = modalidade;
}
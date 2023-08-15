class Usuario{
  String user="";
  String senha = "";

  //construtor

  Usuario(this.user, this.senha);

  //getters e setters 

  String get getUser => user;
  set setUser( user) => this.user = user;
  String get getSenha => senha;
  set setSenha( senha) => this.senha = senha;
}
import 'usuario.dart';

class UsuarioRepository{
  List<Usuario> _listaUsurios = [];
  //construtor
  UsuarioRepository(){
    _listaUsurios = [];

    void adicionar(Usuario u1){
      _listaUsurios.add(u1);
    }
    
    
    
    
    bool logar(String user, String senha){
      for(var i=0; i<_listaUsurios.length; i++){
        if(user==({_listaUsurios[i].user}) && senha==({_listaUsurios[i].senha})){
          return true;
        }
      }
      return false;
    }
  }
}
import 'usuario.dart';

class UsuarioRepository{
  List<Usuario> _listaUsurios = [];
  //construtor



    void adicionar(Usuario u1){
      _listaUsurios.add(u1);
    }
    
    
    
    
    bool logar(u1){
      for(var u in _listaUsurios)
        if(u1.user==u.user && u1.senha==u.senha){
          return true;
        }
      return false;
    }
  
}
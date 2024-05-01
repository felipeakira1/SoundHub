import 'package:soundhub/models/usuario.dart';

import '../models/usuario.dart';

class UsuariosManager {
  // Instancia singleton
  static final UsuariosManager _instance = UsuariosManager._internal();

  // Construtor privado
  UsuariosManager._internal();

  // Factory method to access the singleton
  factory UsuariosManager() {
    return _instance;
  }

  final List<Usuario> _usuarios = [];
  Usuario? _usuariologado;

  void adicionarUsuario(Usuario usuario) {
    _usuarios.add(usuario);
  }

  void verificarLogin(String email, String senha)
  {
    for(Usuario usuario in _usuarios)
    {
      if(usuario.email == email && usuario.senha == senha)
      {
        _usuariologado = usuario;
        return;
      }
    }
  }

  bool usuarioLogado()
  {
    return _usuariologado != null;
  }
  
  List<Usuario> get usuarios => _usuarios;
}
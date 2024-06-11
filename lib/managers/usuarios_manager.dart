import 'package:soundhub/models/user.dart';

import '../models/user.dart';

class UsuariosManager {
  // Instancia singleton
  static final UsuariosManager _instance = UsuariosManager._internal();

  // Construtor privado
  UsuariosManager._internal();

  // Factory method to access the singleton
  factory UsuariosManager() {
    return _instance;
  }

  final List<User> _usuarios = [];
  User? _usuariologado;

  void adicionarUsuario(User usuario) {
    _usuarios.add(usuario);
  }

  void verificarLogin(String email, String senha)
  {
    for(User usuario in _usuarios)
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
  
  List<User> get usuarios => _usuarios;
}
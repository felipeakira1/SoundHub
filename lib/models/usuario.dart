class Usuario {
  final String _nome;
  final String _email;
  final String _username;
  final String _senha;

  Usuario({required String nome, required String email, required String username, required String senha})
   : _nome = nome, _email = email, _username = username, _senha = senha;

  String get nome => _nome;
  String get email => _email;
  String get username => _username;
  String get senha => _senha;
}

class Usuario {
  String _nomeCompleto;
  String _email;
  String _nomeUsuario;
  String _senha;
  List<String> _generosFavoritos;

  Usuario({
    required String nomeCompleto,
    required String email,
    required String nomeUsuario,
    required String senha,
    required List<String> generosFavoritos,
  })  : _nomeCompleto = nomeCompleto,
        _email = email,
        _nomeUsuario = nomeUsuario,
        _senha = senha,
        _generosFavoritos = generosFavoritos;

  // Getters para acessar as informações de fora da classe
  String get nomeCompleto => _nomeCompleto;
  String get email => _email;
  String get nomeUsuario => _nomeUsuario;
  String get senha => _senha;
  List<String> get generosFavoritos => _generosFavoritos;

  // Método para converter o usuário em um mapa para JSON
  Map<String, dynamic> toJson() {
    return {
      'nomeCompleto': _nomeCompleto,
      'email': _email,
      'nomeUsuario': _nomeUsuario,
      'senha': _senha,
      'generosFavoritos': _generosFavoritos,
    };
  }

  // Factory constructor para criar um usuário a partir de um mapa JSON
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nomeCompleto: json['nome'] ?? 'Default Name',  // Adicionando valor padrão
      email: json['email'] ?? 'no-email@example.com',  // Adicionando valor padrão
      nomeUsuario: json['nomeUsuario'] ?? 'defaultUsername',  // Adicionando valor padrão
      senha: json['senha'] ?? 'defaultPassword',  // Adicionando valor padrão
      generosFavoritos: []
    );
  }
}

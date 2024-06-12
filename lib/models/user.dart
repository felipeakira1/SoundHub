class User {
  String? _id;
  String _fullName;
  String _email;
  String _username;
  String _password;
  List<String> _favoriteGenres;

  User({
    String? id,
    required String fullName,
    required String email,
    required String username,
    required String password,
    required List<String> favoriteGenres,
  })  : _id = id,
        _fullName = fullName,
        _email = email,
        _username = username,
        _password = password,
        _favoriteGenres = favoriteGenres;

  String? get id => _id;
  String get fullName => _fullName;
  String get email => _email;
  String get username => _username;
  String get password => _password;
  List<String> get favoriteGenres => _favoriteGenres;

  // Método para converter o usuário em um mapa para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': _id,  // Incluído para permitir serialização completa
      'fullName': _fullName,
      'email': _email,
      'username': _username,
      'password': _password,  // Cuidado com a segurança ao expor senhas
      'favoriteGenres': _favoriteGenres,
    };
  }

  // Factory constructor para criar um usuário a partir de um mapa JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']?.toString(),
      fullName: json['fullName'] ?? 'Default Name',
      email: json['email'] ?? 'no-email@example.com',
      username: json['username'] ?? 'defaultUsername',
      password: json['password'] ?? 'defaultPassword',
      favoriteGenres: List<String>.from(json['favoriteGenres'] ?? []),
    );
  }
}

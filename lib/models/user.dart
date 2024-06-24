class User {
  String _fullName;
  String _username;

  User({
    required String fullName,
    required String username,
  })  : _fullName = fullName,
        _username = username;

  String get fullName => _fullName;
  String get username => _username;

  // Método para converter o usuário em um mapa para JSON
  Map<String, dynamic> toJson() {
    return {
      'name': _fullName,
      'username': _username,
    };
  }

  // Factory constructor para criar um usuário a partir de um mapa JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['name'] ?? 'Default Name',
      username: json['username'] ?? 'defaultUsername',
    );
  }
}

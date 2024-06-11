import 'package:dio/dio.dart';
import '../models/usuario.dart';

class UserProvider {
  final Dio _dio = Dio();

  // Singleton pattern
  static final UserProvider _instance = UserProvider._createInstance();
  UserProvider._createInstance();
  factory UserProvider() {
    return _instance;
  }

  // URL
  final String _url = "https://localhost:3000";

  Future<List<Usuario>> getAllUsuarios() async {
    final response = await _dio.get("$_url/users");
    if(response.statusCode == 200) {
      List<Usuario> usuarios = [];
      // Caso em que nao ha usuarios
      if(response.data == null) {
        return usuarios;
      } else {
        response.data.forEach((id, data) {
          usuarios.add(Usuario.fromJson(data, id));
        });
        return usuarios;
      }
    } else {
      throw Exception('Failed to fetch users: Status code ${response.statusCode}');
    }
  }

  /*
  // Future<Usuario> getUsuario(nomeUsuario) async {
  //   Response response = await _dio.get(prefixUrl + nomeUsuario + "/" + suffixUrl);
  //   return Usuario.fromJson(response.data);
  // }

  Future<Usuario> registerUsuario(Usuario usuario) async {
    await _dio.post("https://si700-d067a-default-rtdb.firebaseio.com/usuarios/.json", data: usuario.toJson());
    return usuario;
  }


  Future<void> deleteUsuario(String id) async {
    try {
      final url = "$prefixUrl/usuarios/$id$suffixUrl";
      Response response = await _dio.delete(url);
      if (response.statusCode != 200) {
        throw Exception('Failed to delete user: Status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }
  */
}

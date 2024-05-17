import 'package:dio/dio.dart';
import '../models/usuario.dart';

class DataProvider {
  final Dio _dio = Dio();

  static final DataProvider _instance = DataProvider._createInstance();
  DataProvider._createInstance();
  factory DataProvider() {
    return _instance;
  }

  String prefixUrl = "https://si700-d067a-default-rtdb.firebaseio.com/";
  String suffixUrl = ".json";

  // Future<Usuario> getUsuario(nomeUsuario) async {
  //   Response response = await _dio.get(prefixUrl + nomeUsuario + "/" + suffixUrl);
  //   return Usuario.fromJson(response.data);
  // }

  Future<Usuario> registerUsuario(Usuario usuario) async {
    await _dio.post("https://si700-d067a-default-rtdb.firebaseio.com/usuarios/.json", data: usuario.toJson());
    return usuario;
  }

  Future<List<Usuario>> fetchAllUsuarios() async {
    final response = await _dio.get("https://si700-d067a-default-rtdb.firebaseio.com/usuarios/.json");
    if(response.statusCode == 200) {
      List<Usuario> usuarios = [];
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

  // Implemente métodos para remover e listar usuários aqui
}

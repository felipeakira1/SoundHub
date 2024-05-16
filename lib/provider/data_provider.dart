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

  Future<Usuario> getUsuario(nomeUsuario) async {
    Response response = await _dio.get(prefixUrl + nomeUsuario + "/" + suffixUrl);
    return Usuario.fromJson(response.data);
  }

  Future<void> registerUsuario(Usuario usuario) async {
    await _dio.post("https://si700-d067a-default-rtdb.firebaseio.com/usuarios/.json", data: usuario.toJson());
  }

  Future<List<Usuario>> fetchAllUsuarios() async {
    final response = await _dio.get("https://si700-d067a-default-rtdb.firebaseio.com/usuarios/.json");
    if(response.statusCode == 200) {
      List<Usuario> usuarios = [];
      response.data.forEach((id, data) {
        usuarios.add(Usuario.fromJson(data));
      });
      return usuarios;
    } else {
      throw Exception('Failed to fetch users: Status code ${response.statusCode}');
    }
  }

  // Implemente métodos para remover e listar usuários aqui
}

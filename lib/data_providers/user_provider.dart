import 'package:dio/dio.dart';
import '../models/user.dart';

class UserProvider {
  final Dio _dio = Dio();

  // Singleton pattern
  static final UserProvider _instance = UserProvider._createInstance();
  UserProvider._createInstance();
  factory UserProvider() {
    return _instance;
  }

  // URL
  final String _url = "localhost:3000";

  Future<List<User>> getAllUsers() async {
    try {
      final response = await _dio.get(_url);
      print(response.data);
      // if(response.statusCode == 200) {
      //   if(response.data is Map) {
      //     print("eh um mapa!");
      //   } else if (response.data is List) {
      //     List<User> users = response.data.map((e) => User.fromJson(e)).toList();
      //     return users;
      //   }
      // }
      return [];
    } catch (e) {
      if(e is DioError) {
        print('Dio Error');
      } else {
        print('unexpected error');
      }
      throw Exception('Failed to fetch users: $e');
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

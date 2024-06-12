import 'dart:async';

import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../models/user.dart';

class UserProvider {
  final Dio _dio = Dio();

  // Singleton pattern
  static final UserProvider instance = UserProvider._createInstance();
  UserProvider._createInstance();
  factory UserProvider() {
    return instance;
  }

  // URL
  final String _url = "http://localhost:3000/users";

  Future<List<User>> getAllUsers() async {
    try {
      Response response = await _dio.get(_url);
      if(response.statusCode == 200) {
        List<User> users = [];
        response.data.forEach((value) {
          User user = User.fromJson(value);
          users.add(user);
        });
        return users;
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }

  final StreamController _controller = StreamController();

  Stream get stream {
    Socket socket = io("http://localhost:3000", OptionBuilder().setTransports(['websocket']).build());
    socket.connect();
    socket.on("USER_CREATED", (data) {
      _controller.sink.add(data);
    });

    return _controller.stream;
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

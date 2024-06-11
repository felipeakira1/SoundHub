import 'package:dio/dio.dart';

void main() async {
  fetchUsers();
}

void fetchUsers() async {
  var dio = Dio();

  try {
    String url = 'http://localhost:3000/users';
    Response response = await dio.get(url);
    print(response.data);
  } catch (e) {
    print("$e");
  }
}
import 'package:dio/dio.dart';
import 'package:soundhub/models/user.dart';

void main() async {
  fetchUsers();
}

void fetchUsers() async {
  var dio = Dio();

  try {
    String url = 'http://localhost:3000/users';
    Response response = await dio.get(url);
    print(response.data);
    List<User> users = [];
    response.data.forEach((value) {
      User user = User.fromJson(value);
      users.add(user);
    });
    users.forEach((element) {print(element.fullName);});
  } catch (e) {
    print("$e");
  }
}
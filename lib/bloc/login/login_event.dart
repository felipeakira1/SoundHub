// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  String email;
  String password;

  LoginSubmitted({
    required this.email,
    required this.password,
  });
}

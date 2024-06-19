// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  String name;
  String email;
  String password;
  String username;

  RegisterSubmitted({
    required this.name,
    required this.email,
    required this.password,
    required this.username,
  });
}

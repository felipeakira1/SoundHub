// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState {}

class Unauthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  User? user;
  Authenticated({required this.user});
}

class AuthenticationError extends AuthenticationState {
  final String message;

  AuthenticationError({required this.message});
}
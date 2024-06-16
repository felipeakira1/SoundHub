import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationEvent {}

class AuthenticationServerEvent extends AuthenticationEvent {
  User? user;
  AuthenticationServerEvent(this.user);
}
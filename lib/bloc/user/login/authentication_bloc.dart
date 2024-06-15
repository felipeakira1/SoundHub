// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:soundhub/data_providers/firebase_authentication_service.dart';

class AuthenticationBloc extends Bloc<AuthEvent, AuthenticationState> {
  final FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();

  AuthenticationBloc() : super(Unauthenticated()) {
    _firebaseAuthenticationService.user.listen((event) {
      add(AuthServerEvent(user: event));
    });

    on<AuthServerEvent>((event, emit) {
      if (event.user == null) { // Usuario nulo
        emit(Unauthenticated());
      } else {
        // FirestoreDatabaseProvider.helper.uid = event.userModel!;
        emit(Authenticated(user: event.user));
      }
    });
    
    on<LoginUser>((event, emit) async {
      try {
        User? user = await _firebaseAuthenticationService.signInWithEmailAndPassword(event.email, event.password);
        if(user == null) {
          emit(AuthenticationError(message: "Credenciais inválidas!"));
        }
      } catch (e) {
        emit(AuthenticationError(message: "Erro ao autenticar: ${e.toString()}"));
      }
    });


  }
}
/*
  Events
*/

abstract class AuthEvent {}

class LoginUser extends AuthEvent {
  String email;
  String password;

  LoginUser({required this.email, required this.password});
}

class AuthServerEvent extends AuthEvent {
  User? user;
  AuthServerEvent({required this.user});
}

/*
  States
*/
abstract class AuthenticationState {}

class Unauthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  User? user;
  Authenticated({required this.user});
}

class AuthenticationError extends AuthenticationState {
  String message;
  AuthenticationError({required this.message});
}


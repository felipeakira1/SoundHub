import 'package:bloc/bloc.dart';
import 'package:soundhub/bloc/authentication/authentication_event.dart';
import 'package:soundhub/bloc/authentication/authentication_state.dart';
import 'package:soundhub/data_providers/firebase_authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuthenticationService _authenticationService = FirebaseAuthenticationService();
  late StreamSubscription<User?> _userSubscription;

  AuthenticationBloc() : super(Unauthenticated()) {
    _userSubscription = _authenticationService.user.listen((User? user) {
      add(AuthenticationServerEvent(user));
    });

    on<AuthenticationServerEvent>(_onAuthenticationServerEvent);
  }

  void _onAuthenticationServerEvent(AuthenticationServerEvent event, Emitter<AuthenticationState> emit) {
    if (event.user == null) {
      emit(Unauthenticated());
    } else {
      emit(Authenticated(user: event.user!));
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}

import 'package:bloc/bloc.dart';
import 'package:soundhub/data_providers/firebase_authentication_service.dart';
import 'package:soundhub/bloc/login/login_event.dart';
import 'package:soundhub/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();

  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((LoginSubmitted event, Emitter<LoginState> emit) async {
      emit(LoginLoading());
      try {
        await _firebaseAuthenticationService.signInWithEmailAndPassword(event.email, event.password);
        emit(LoginSuccessful());
      } catch (e) {
        emit(LoginFailure(message: "Erro ao realizar login: $e"));
      }
    });
  }
}

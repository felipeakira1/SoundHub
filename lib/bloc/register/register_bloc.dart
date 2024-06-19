import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soundhub/data_providers/firebase_authentication_service.dart';
import 'package:soundhub/data_providers/firestore_user_data_provider.dart';
import 'package:soundhub/bloc/register/register_event.dart';
import 'package:soundhub/bloc/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();
  FirestoreUserDataProvider _firestoreUserService = FirestoreUserDataProvider();

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterSubmitted>((RegisterSubmitted event, Emitter<RegisterState> emit) async {
      emit(RegisterLoading());
      try {
        User? user = await _firebaseAuthenticationService.createUserWithEmailAndPassword(event.email, event.password);
        if(user != null) {
          await _firestoreUserService.insertUser(user, {
            "name": event.name,
            "email": event.email,
            "password": event.password,
            "username": event.username
          });
          await _firebaseAuthenticationService.signOut();
          emit(RegisterSuccessful());
        }
      } catch (e) {
        emit(RegisterError(message: e.toString()));
      }
    });
  }
}
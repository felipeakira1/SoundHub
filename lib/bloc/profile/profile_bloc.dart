import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/profile/profile_event.dart';
import 'package:soundhub/bloc/profile/profile_state.dart';
import 'package:soundhub/data_providers/firebase_authentication_service.dart';
import 'package:soundhub/data_providers/firestore_user_data_provider.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();
  final FirestoreUserDataProvider _firestoreUserDataProvider = FirestoreUserDataProvider();

  ProfileBloc() : super(ProfileInitial()) {

    on<LoadProfile>((event, emit) async {
      emit(ProfileLoading());
      User? currentUser = _firebaseAuthenticationService.getCurrentUser();
      if(currentUser != null && currentUser.email != null) {
        try {
            Map<String, dynamic>? userDetails = await _firestoreUserDataProvider.getUserByUid(currentUser.uid);
            if(userDetails != null) {
              emit(ProfileLoaded(email: currentUser.email, name: userDetails['name'], username: userDetails['username']));
            } else {
              emit(ProfileEmpty());
            }
        } catch (e) {
          emit(ProfileLoadError(message: "Error retrieving user data: $e"));
        }
      } else {
          emit(ProfileEmpty());
        }
    });

    on<UpdateProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        User? currentUser = _firebaseAuthenticationService.getCurrentUser();
        if(currentUser != null) {
          await _firestoreUserDataProvider.updateUser(currentUser.uid, {
            'name': event.name,
            'username': event.username
          });
          emit(ProfileUpdated(email: currentUser.email, name: event.name, username: event.username));
        } else {
          emit(ProfileUpdateError(message: 'No authenticated user found'));
        }
      } catch (e) {
        emit(ProfileUpdateError(message: '$e'));
      }
    });

    on<ProfileSignOut>((event, emit) async {
      emit(ProfileLoading());
      try {
        await _firebaseAuthenticationService.signOut();
      } catch(e) {
        emit(ProfileLoadError(message: 'Erro ao sair: $e'));
      }
    });
  }
}
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/authentication/authentication_bloc.dart';
import 'package:soundhub/bloc/authentication/authentication_state.dart';
import 'package:soundhub/bloc/profile/profile_event.dart';
import 'package:soundhub/bloc/profile/profile_state.dart';
import 'package:soundhub/data_providers/firebase_authentication_service.dart';
import 'package:soundhub/data_providers/firestore_user_data_provider.dart';
import 'package:soundhub/models/user.dart' as modelUser;

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirestoreUserDataProvider _firestoreUserDataProvider = FirestoreUserDataProvider();
  final FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();
  final BuildContext context;

  ProfileBloc(this.context) : super(ProfileInitial()) {
    on<ProfileLoad>((event, emit) async {
      emit(ProfileLoading());
      try {
        AuthenticationState authState = context.read<AuthenticationBloc>().state;
        if(authState is Authenticated) {
          String? email = authState.user.email;
          if(email != null) {
            Map<String, dynamic>? userDetails = await _firestoreUserDataProvider.getUserByEmail(email);
            if(userDetails != null) {
              
              emit(ProfileLoaded(user: modelUser.User.fromJson(userDetails)));
            }
          } else {
            emit(ProfileEmpty());
          }

        }
      }catch (e) {
        emit(ProfileError(message: "Error: $e"));
      }
    });
  }
}
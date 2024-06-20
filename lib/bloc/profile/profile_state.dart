// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:soundhub/models/user.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileEmpty extends ProfileState {}

class ProfileLoaded extends ProfileState {
  User user;
  
  ProfileLoaded({
    required this.user,
  });
}

class ProfileError extends ProfileState {
  String message;
  ProfileError({
    required this.message,
  });
}

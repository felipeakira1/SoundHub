import 'package:soundhub/models/user.dart';

abstract class UserState {}

class UsersLoading extends UserState {}

class UsersLoaded extends UserState {
  List<User> users;
  
  UsersLoaded({required this.users});
}

class UsersError extends UserState {
  final String message;
  UsersError({required this.message});
}

class UsersEmpty extends UserState {}
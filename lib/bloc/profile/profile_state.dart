// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileEmpty extends ProfileState {}

class ProfileLoaded extends ProfileState {
  String? email;
  String name;
  String username;
  ProfileLoaded({
    required this.email,
    required this.name,
    required this.username,
  });
}

class ProfileLoadError extends ProfileState {
  String message;
  ProfileLoadError({
    required this.message,
  });
}

class ProfileUpdating extends ProfileState {}

class ProfileUpdated extends ProfileState {
  String? email;
  String name;
  String username;
  ProfileUpdated({
    required this.email,
    required this.name,
    required this.username,
  });
}

class ProfileUpdateError extends ProfileState {
  String message;
  ProfileUpdateError({
    required this.message,
  });
}
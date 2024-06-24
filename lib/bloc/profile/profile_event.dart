// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ProfileEvent {}

class ProfileLoad extends ProfileEvent {}

class ProfileUpdate extends ProfileEvent {
  String name;
  String email;
  ProfileUpdate({
    required this.name,
    required this.email,
  });
}

class ProfileSignOut extends ProfileEvent {}
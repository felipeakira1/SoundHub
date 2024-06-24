// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  String name;
  String username;
  UpdateProfile({
    required this.name,
    required this.username,
  });
}

class ProfileSignOut extends ProfileEvent {}
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccessful extends RegisterState {}

class RegisterError extends RegisterState {
  final String message;

  RegisterError({required this.message});
}
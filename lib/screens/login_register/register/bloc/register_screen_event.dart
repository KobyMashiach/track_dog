part of 'register_screen_bloc.dart';

@immutable
abstract class RegisterScreenEvent {}

class RegisterScreenEventRegister extends RegisterScreenEvent {
  final String email;
  final String password;

  RegisterScreenEventRegister({required this.email, required this.password});
}

class RegisterScreenEventNavLoginScreen extends RegisterScreenEvent {}

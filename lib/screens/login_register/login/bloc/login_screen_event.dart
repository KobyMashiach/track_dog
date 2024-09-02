part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenEvent {}

class LoginScreenEventLogin extends LoginScreenEvent {
  final String email;
  final String password;

  LoginScreenEventLogin({required this.email, required this.password});
}

class LoginScreenEventNavRegisterScreen extends LoginScreenEvent {}

class LoginScreenEventNavReportDogScreen extends LoginScreenEvent {}

class LoginScreenEventNavForgotPasswordScreen extends LoginScreenEvent {}

class LoginScreenEventSendMailRecover extends LoginScreenEvent {
  final String email;

  LoginScreenEventSendMailRecover({required this.email});
}

part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenState {}

final class LoginScreenInitial extends LoginScreenState {}

final class LoginScreenLoading extends LoginScreenState {}

final class LoginScreenFinishLoading extends LoginScreenState {}

@immutable
abstract class LoginScreenStataNavi extends LoginScreenState {}

final class LoginScreenNaviToHomeScreen extends LoginScreenStataNavi {}

final class LoginScreenNaviToPasswordRecoveryScreen
    extends LoginScreenStataNavi {}

final class LoginScreenNaviToRegisterScreen extends LoginScreenStataNavi {}

final class LoginScreenFailedLogin extends LoginScreenStataNavi {
  final String message;

  LoginScreenFailedLogin({required this.message});
}

final class LoginScreenNaviToLoginScreen extends LoginScreenStataNavi {}

final class LoginScreenFailedSendMail extends LoginScreenStataNavi {
  final String message;

  LoginScreenFailedSendMail({required this.message});
}

final class LoginScreenNaviToReportDogScreen extends LoginScreenStataNavi {}
